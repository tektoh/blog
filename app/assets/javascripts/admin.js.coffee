# = require rails-ujs
# = require jquery/dist/jquery
# = require bootstrap-sass/assets/javascripts/bootstrap
# = require admin-lte/dist/js/adminlte
# = require moment/moment
# = require moment/locale/ja
# = require eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min
# = require select2/dist/js/select2
# = require select2/dist/js/i18n/ja.js
# = require autosize/dist/autosize

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

  $('.js-article-block-forms').each ->
    $root = $(@)
    uuid = $root.data('article-uuid')

    $root.on 'ajax:success', '.js-insert-article-block', ->
      reload()

    $root.on 'ajax:error', '.js-insert-article-block', ->
      alert('エラーが発生しました')

    $root.on 'ajax:complete', '.js-insert-article-block', ->
      $root.find('.modal').modal('hide')

    $root.on 'ajax:before', '.js-remove-article-block', ->
      confirm('ブロックを削除しますか？')

    $root.on 'ajax:success', '.js-remove-article-block', ->
      reload()

    $root.on 'ajax:error', '.js-remove-article-block', ->
      alert('エラーが発生しました')

    $root.on 'ajax:success', '.js-swap-level-article-block', ->
      reload()

    $root.on 'ajax:error', '.js-swap-level-article-block', ->
      alert('エラーが発生しました')

    $root.on 'ajax:success', '.js-edit-article-block', (event) ->
      $content = $(@).parents('.js-article-block-content')
      $content.html(event.detail[0].body.innerHTML)
      $content.find('.js-article-block-editor').articleBlockEditor()

    $root.on 'ajax:success', '.js-update-article-block', ->
      reload()

    $root.on 'ajax:error', '.js-update-article-block', ->
      alert('エラーが発生しました')

    $root.on 'click', '.js-cancel-article-block', (event) ->
      event.preventDefault()
      reload()

    reload = ->
      $.ajax
        method: 'GET'
        url: "/admin/articles/#{uuid}/article_blocks"
        dataType: 'html'
        cache: false

      .done (data) =>
        $root.html(data)

      .fail =>
        alert('エラーが発生しました')

    reload()
