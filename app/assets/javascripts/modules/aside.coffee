class OHM.Aside

  constructor: ->
    @asideArea = $('#aside')
    @init()

  init: ->
    $.ajax(
      url: '/aside',
    ).done( (data)=>
      @asideArea.html(data)
    );

