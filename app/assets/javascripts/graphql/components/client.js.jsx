window.Client = React.createClass({
  componentDidMount: function() {
    if (this.state.query) {
      this.handleSubmit()
    }
  },
  getInitialState: function() {
    return {
      query: "query readHero {\n  hero { name }\n}",
      response: "",
    }
  },
  render: function() {
    editorHeight = "300px"
    editorShadow = "-3px 4px 2px rgba(0,0,0, 0.08) "
    return (
      <div>
        <div className="row margin-top-5">
          <div className='col md-5'>
            <h3>Query</h3>
            <QueryEditor
              query={this.state.query}
              onChange={this.handleQueryChange}
              height={editorHeight}
              boxShadow={editorShadow}
            />
          </div>
          <div className='col md-5'>
            <h3>Response</h3>
            <QueryResponse
              response={this.state.response}
              height={editorHeight}
              boxShadow={editorShadow}
            />
          </div>
          <div className='col md-2'>
            {/*<QueryHistory
              onQueryClick={this.handleQueryClick}
            />*/}
            <h3>See More</h3>
            <ul className="unstyled">
              <li>> <a href='https://github.com/rmosolgo/graphql-ruby-demo/tree/master/app/graph' target='_blank'>schema defintion</a></li>
              <li>> <a href='http://github.com/rmosolgo/graphql-ruby' target='_blank'>graphql-ruby</a></li>
              <li>> <a href='http://facebook.github.io/graphql' target='_blank'>GraphQL spec</a></li>
            </ul>
          </div>
        </div>
        <div className="row margin-top-5">
          <div className='col md-5'>
            <button className='btn' onClick={this.handleSubmit}>submit</button>
          </div>
          <div className='col md-5'>
            <select
              defaultValue={null}
              onChange={this.handleQuerySelect}
              className='form-control'
            >
              {this._getQueryOptionGroups()}
            </select>
          </div>
        </div>
      </div>
    )
  },

  handleQueryChange: function(ev) {
    this.setState({query: ev.target.value})
  },

  handleQuerySelect: function(ev) {
    this.setState({query: ev.target.value}, function() {
      this.handleSubmit()
    })
  },

  handleQueryClick: function(queryString) {
    this.setState({query: queryString})
  },
  handleSubmit: function(ev) {
    var query = this.state.query
    QueryStore.push(query)

    var _this = this

    fetch(this.props.endpoint, {
      method: 'post',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({query: this.state.query}),
    }).then(function(response) {
      return response.json()
    }).then(function(json){
      var prettyResponse = JSON.stringify(json, undefined, 2)
      _this.setState({response: prettyResponse})
    }).catch(function(err) {
      _this.setState({response: "Uh oh, something went wrong!\n-----\n" + err})
    })
  },

  _getQueryOptionGroups: function() {
    if (this._queryOptionGroups) { return this._queryOptionGroups }
    var queryOptionGroups = []
    var optGroup, queries, queryText, queryOptions
    for (queryGroup in this.props.queryGroups) {
      queries = this.props.queryGroups[queryGroup]
      queryOptions = []
      for (queryName in queries) {
        queryText = queries[queryName]
        queryOptions.push(<option key={queryName} value={queryText}>{queryName}</option>)
      }
      queryOptionGroups.push(<optgroup key={queryGroup} label={queryGroup}>{queryOptions}</optgroup>)
    }
    return this._queryOptionGroups = queryOptionGroups
  }
})
