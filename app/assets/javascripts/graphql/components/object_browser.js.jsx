var _typeof = function(obj) {
  var raw = Object.prototype.toString.call(obj)
  var from = 8
  var forLen = raw.length - 9
  return raw.substr(from, forLen)
}

_isSimple = function(obj) {
  var objType = _typeof(obj)
  return objType === "String" || objType == "Number" || objType == "Null"
}

window.ObjectBrowser = React.createClass({
  getInitialState: function(){
    return {
      showingChildren: !!this.props.open,
    }
  },
  propTypes: {
    object: React.PropTypes.any,
    nesting: React.PropTypes.number,
  },
  getStyle: function() {
    return {
      fontFamily: "Monaco, monospace",
      marginLeft: this.props.nesting * 5,
    }
  },
  getPStyle: function() {
    return {
      cursor: "pointer",
      fontWeight: (this.state.showingChildren ? 700 : 100),
      color: (this.state.showingChildren ? "#111" : "#777")
    }
  },
  render: function() {
    var children = []
    var object = this.props.object
    var objectType = _typeof(object)

    if (objectType === "Object") {
      var keys = Object.keys(object)
      if (keys.length === 1) {
        return (
          <ObjectBrowser object={object[keys[0]]} title={this.props.title + "." + keys[0]} nesting={this.props.nesting} />
        )
      }
    }

    if (objectType === "Array") {
      var anyObjects = object.some(function(item) { return _typeof(item) === "Object" })
      if (!anyObjects) {
        object = JSON.stringify(object)
        objectType = "String"
      }
    }

    if (_isSimple(object)) {
      children.push(<ObjectBrowser key={key} title={object} nesting={this.props.nesting + 1} />)
    } else if (objectType === "Object") {
      for (key in object) {
        newObject = object[key]
        if (_isSimple(newObject)) {
          children.push(<ObjectBrowser key={key} title={key + ": " + JSON.stringify(newObject)} nesting={this.props.nesting + 1} />)
        } else {
          children.push(<ObjectBrowser key={key} object={newObject} nesting={this.props.nesting + 1} title={key} />)
        }
      }
    } else if (objectType === "Array") {
      object.forEach(function(item, idx){
        children.push(<ObjectBrowser key={"ary-" + idx} object={item} nesting={this.props.nesting + 1} title={idx} />)
      }, this)
    }
    return(
      <div style={this.getStyle()}>
        <p onClick={this.handleClick} style={this.getPStyle()}>
          {this.props.title} {children.length ? (this.state.showingChildren ? "v" : ">") : "" }
        </p>
        <div>
          {this.state.showingChildren ? children : null}
        </div>
      </div>
    )
  },
  handleClick: function() {
    this.setState({showingChildren: !this.state.showingChildren})
  },
})