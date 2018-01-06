# = require jquery2
# = require jquery_ujs
# = require cocoon

$ ->
  $('.js-datetimepicker').datetimepicker
    locale: 'ja'
    sideBySide: true
    toolbarPlacement: 'bottom'
    showTodayButton: true
    showClear: true
    format: 'YYYY-MM-DD HH:mm'

  $('.js-select2').select2()

  autosize $('.js-autosize')
