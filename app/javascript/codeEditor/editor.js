import React, { Component } from 'react'
import PropTypes from 'prop-types'
import AceEditor from 'react-ace'

import 'brace/theme/monokai'

const CODE_LANGS = {
  plaintext:  { mode: 'plain_text', label: 'Plain Text' },
  c:          { mode: 'c_cpp', label: 'C' },
  javascript: { mode: 'javascript', label: 'JavaScript' },
  html:       { mode: 'html', label: 'HTML' },
  css:        { mode: 'css', label: 'CSS' },
  scss:       { mode: 'scss', label: 'SCSS' },
  php:        { mode: 'php', label: 'PHP' },
  python:     { mode: 'python', label: 'Python' },
  ruby:       { mode: 'ruby', label: 'Ruby' },
  sql:        { mode: 'sql', label: 'SQL' },
  shell:      { mode: 'sh', label: 'Shell' },
}

Object.entries(CODE_LANGS).map(data => {
  const { mode } = data[1]
  require(`brace/mode/${mode}`)
})

export default class Editor extends Component {
  static propTypes = {
    value: PropTypes.string,
    onChangeMode: PropTypes.func,
    onChangeBody: PropTypes.func
  }

  constructor (props) {
    super(props)

    this.state = {
      mode: props.mode || 'plain_text',
      value: props.value || ''
    }
  }

  onChangeMode = (e) => {
    const mode = e.target.value
    this.setState({ mode })
    if (this.props.onChangeMode) {
      this.props.onChangeMode(mode)
    }
  }

  onChangeBody = (value) => {
    this.setState({ value })
    if (this.props.onChangeBody) {
      this.props.onChangeBody(value)
    }
  }

  render () {
    return (
      <div>
        <div className="form-inline">
          <div className="form-group">
            <select
              className="form-control"
              value={this.state.mode}
              onChange={this.onChangeMode}
            >
              {(Object.entries(CODE_LANGS).map(data => {
                const key = data[0]
                const { mode, label } = data[1]
                return (
                  <option key={key} value={mode}>{label}</option>
                )
              }))}
            </select>
          </div>
        </div>
        <br/>
        <AceEditor
          value={this.state.value}
          mode={this.state.mode}
          onChange={this.onChangeBody}
          theme="monokai"
          fontSize={14}
          showPrintMargin={true}
          showGutter={true}
          highlightActiveLine={true}
          setOptions={{
            showLineNumbers: true,
            tabSize: 2,
          }}
          width="100%"
          height="400px"
        />
      </div>
    )
  }
}
