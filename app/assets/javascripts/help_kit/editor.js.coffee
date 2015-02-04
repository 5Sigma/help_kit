$ ->
  if $('#editor').length > 0
    editor = ace.edit 'editor'
    editor.setOptions
      highlightActiveLine: true
      highlightGutterLine: true
      dragDelay: 10
    editor.getSession().setMode("ace/mode/markdown")
    editor.getSession().setUseWrapMode(!0)

$(document).on 'click', 'a.save-article', (e) ->
  e.preventDefault()
  editor = ace.edit 'editor'
  mark_down = editor.getSession().getValue()
  $('#article_content').val(mark_down)
  $('#article_title').val($('#article_title_temp').val())
  $('.article-details-modal form').submit()

$(document).on 'click', 'a.article-details', (e) ->
  e.preventDefault()
  modal = $('.article-details-modal')
  modal.css opacity: 0, scale: 0.8
  modal.show()
  modal.transition opacity: 1, scale: 1, 500



$(document).on 'click', '.hide-article-modal', (e) ->
  e.preventDefault()
  $('.article-details-modal').hide()


$(document).on 'click', 'a.save-category', (e) ->
  e.preventDefault()
  editor = ace.edit 'editor'
  $('#category_header_content').val(editor.getSession().getValue())
  $('form.simple_form').submit()
