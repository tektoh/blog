/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Rails from 'rails-ujs';
Rails.start();

$(() => {
  $('.js-datetimepicker').datetimepicker({
    locale: 'ja',
    sideBySide: true,
    toolbarPlacement: 'bottom',
    showTodayButton: true,
    showClear: true,
    format: 'YYYY-MM-DD HH:mm'
  });

  $('.js-select2').select2({
    theme: 'bootstrap4'
  });

  autosize($('.js-autosize'));

  $('.js-article-block-forms').each(function () {
    const $root = $(this);
    const uuid = $root.data('article-uuid');

    const reload = () => {
      $.ajax({
        method: 'GET',
        url: `/admin/articles/${uuid}/article_blocks`,
        dataType: 'html',
        cache: false
      })
        .done(data => {
          $root.html(data);
          $root.find('.js-article-block-sentence-editor').sentenceEditor();
          $root.find('.js-article-block-code-editor').codeEditor();
        })
        .fail(() => {
          alert('エラーが発生しました')
        });
    }

    $root.on('ajax:success', '.js-insert-article-block', function () {
      reload();
    });

    $root.on('ajax:error', '.js-insert-article-block', function () {
      alert('エラーが発生しました');
    });

    $root.on('ajax:complete', '.js-insert-article-block', function () {
      $root.find('.modal').modal('hide')
      $('body').removeClass('modal-open');
      $('.modal-backdrop').remove();
    });

    $root.on('ajax:before', '.js-remove-article-block', function () {
      confirm('ブロックを削除しますか？');
    });

    $root.on('ajax:success', '.js-remove-article-block', function () {
      reload();
    });

    $root.on('ajax:error', '.js-remove-article-block', function () {
      alert('エラーが発生しました');
    })

    $root.on('ajax:success', '.js-swap-level-article-block', function () {
      reload();
    });

    $root.on('ajax:error', '.js-swap-level-article-block', function () {
      alert('エラーが発生しました')
    });

    $root.on('ajax:success', '.js-edit-article-block', function (event) {
      const $content = $(this).parents('.js-article-block-content');
      $content.html(event.detail[0].body.innerHTML);
      $content.find('.js-article-block-sentence-editor').sentenceEditor();
      $content.find('.js-article-block-code-editor').codeEditor();
    });

    $root.on('ajax:success', '.js-update-article-block', function (event) {
      const data = event.detail[2].responseText
      if (data) {
        const $content = $(event.currentTarget).parent('.js-article-block-content');
        $content.html(data);
      } else {
        reload()
      }
    });

    $root.on('ajax:error', '.js-update-article-block', function () {
      alert('エラーが発生しました');
    });

    $root.on('click', '.js-cancel-article-block', function (event) {
      event.preventDefault();
      console.log(111);
      reload();
    });

    reload();
  })
});
