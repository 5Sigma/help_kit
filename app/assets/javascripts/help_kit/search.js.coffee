$(document).on 'click', 'button.search-button', (e) ->
  return if $('#article-search').hasClass('active')
  e.preventDefault()
  e.stopPropagation()
  $('#article-search').addClass('active')
  $('#article-search .input-container').css {background: '#454545'}
  $('#article-search .input-container').transition {width: '200px'}, 400, 'ease', ->
    $('#article-search .search-input').transition {opacity: 1}, 400, 'ease', ->
      $('#article-search .input-container input').focus()

$(document).on 'click', '#article-search', (e) ->
  e.stopPropagation()

$(document).click ->
  $('#article-search .search-input').transition {opacity: 0}, 300, 'ease', ->
    $('#article-search .input-container').transition {width: '0px'}, 400, 'ease', ->
      $('#article-search .input-container').transition {background: 'transparent'}, 300, 'ease', ->
        $('#article-search').removeClass('active')




