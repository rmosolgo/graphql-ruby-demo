window.QueryEditor = React.createClass({
  propTypes: {
    query: React.PropTypes.string,
    height: React.PropTypes.any,
    boxShadow: React.PropTypes.any,
    onChange: React.PropTypes.func,
  },
  componentDidMount: function() {
    var textarea = this.getDOMNode().firstChild
    textarea.focus()
  },
  render: function() {
    var editorStyle = {
      height: this.props.height,
      overflow: "scroll",
      boxShadow: this.props.boxShadow,
      borderRadius: "3px",
    }
    return (
      <CodeMirrorEditor
        style={editorStyle}
        textAreaClassName={[]}
        textAreaStyle={editorStyle}
        value={this.props.query}
        mode={'javascript'}
        theme={'solarized'}
        tabSize={2}
        lineNumbers="true"
        onChange={this.props.onChange}
      />
    )
  },
})