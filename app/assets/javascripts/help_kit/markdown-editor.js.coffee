(($, window) ->

  class MDEdit
    defaults:
      show_preview: true
    constructor: (el, options) ->
      @options = $.extend){}, @defaults, options)
      @$sel = $(el)

  $.fn.extend MDEdit: (option,args...) ->
    @each ->
      $this = $(this)
      data = $this.data('MDEdit')
      if !data
        $this.data 'MDEdit', (data = new MDEdit(this,options))
      if typeof option == string
        data[option].apply(data, args)

) window.jQuery, window
