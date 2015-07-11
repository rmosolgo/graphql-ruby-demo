window.QueryResponse = React.createClass({
  propTypes: {
    response: React.PropTypes.string,
    height: React.PropTypes.any,
    boxShadow: React.PropTypes.any,
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
        value={this.props.response}
        mode={{name: 'javascript', json: true}}
        theme={'solarized'}
        tabSize={2}
        lineNumbers="true"
        readOnly="true"
      />
    )
  },
})