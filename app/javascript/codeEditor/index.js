import React from 'react'
import { render } from 'react-dom'
import Editor from './editor'

(function ($, undefined) {
  $.fn.codeEditor = function () {
    this.each((i, elm) => {
      const editorBody = elm.querySelector('.editor-body')
      const codeMode = elm.querySelector('#code_mode')
      const codeBody = elm.querySelector('#code_body')

      const onChangeMode = value => {
        codeMode.value = value
      }

      const onChangeBody = value => {
        codeBody.value = value
      }

      render(
        <Editor
          value={codeBody.value}
          mode={codeMode.value}
          onChangeMode={onChangeMode}
          onChangeBody={onChangeBody}
        />,
        editorBody
      )
    })
  }
})(jQuery)
