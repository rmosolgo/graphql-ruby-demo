window.QueryHistory = React.createClass({
  componentWillMount: function() {
    QueryStore.addChangeHandler(this._handleQueriesChanged)
  },
  componentWillUnmount: function() {
    QueryStore.removeChangeHandler(this._handleQueriesChanged)
  },
  getInitialState: function() {
    return {
      queries: QueryStore.all(),
    }
  },
  render: function() {
    return (
      <div>
        <div className='relative'>
          <h3>History</h3>
          <h3 style={{position: "absolute", top: 2,  right: 10}}>
            <a onClick={this.handleClearClick} href="javascript:void(0);" className='color-error' >
              <span className='icon-trash'/>
            </a>
          </h3>
        </div>
        <ul className='unstyled row'>
          {this.state.queries.map(function(query, idx){
            return (
              <li
                key={query + idx}
                style={{whiteSpace:"nowrap", textOverflow: "ellipsis", overflow: "hidden"}}
              >
                <a href="javascript:void(0);" onClick={this.props.onQueryClick.bind(null, query)}>
                  {query}
                </a>
              </li>
            )
          }, this)}
          {this.state.queries.length ? (
            <li className='text-right'>

            </li>
          ) : null }
        </ul>
      </div>
    )
  },
  handleClearClick: function() {
    QueryStore.clear()
  },
  _handleQueriesChanged: function() {
    this.setState({queries: QueryStore.all()})
  }
})