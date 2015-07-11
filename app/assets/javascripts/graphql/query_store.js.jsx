window.QueryStore = {
  /* query storage */
  _maxLength: 20,
  _queries: [],
  start: function() {
    var queryJSON = window.localStorage.getItem("queries")
    if (queryJSON) {
      var prevQueries = JSON.parse(queryJSON)
      this._queries = this._queries.concat(prevQueries)
    }
    this.emitChange()
  },
  save: function() {
    var queryJSON = JSON.stringify(this._queries)
    window.localStorage.setItem("queries", queryJSON)
  },
  push: function(queryString) {
    // don't repush same query:
    if (this.last() == queryString) { return }

    this._queries.push(queryString)
    if (this._queries.length > this._maxLength) {
      this._queries.shift()
    }
    this.save()
    this.emitChange()
  },
  all: function() {
    return this._queries
  },
  last: function() {
    return this._queries[this._queries.length - 1]
  },
  clear: function() {
    this._queries = []
    this.save()
    this.emitChange()
  },
  /* event emitter */
  _handlers: [],
  addChangeHandler: function(func) {
    this._handlers.push(func)
  },
  removeChangeHandler: function(func) {
    var idx = this._handlers.indexOf(func)
    this._handlers.splice(idx, 1)
  },
  emitChange: function() {
    this._handlers.forEach(function(func){ func() })
  },

}