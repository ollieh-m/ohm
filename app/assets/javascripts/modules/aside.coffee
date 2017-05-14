class OHM.Aside

  constructor: ->
    @asideArea = $('#aside')
    @init()

  init: ->
    $.ajax(
      url: '/aside',
    ).done( (data)=>
      @asideArea.html(data)
      @showLevelOneArrows()
      @initNavTreeInteraction()
    );

  initNavTreeInteraction: ->
    arrows = $('i.fa')
    arrows.click (e)->
      parent = $(this).next().text()
      next_level = Number($(this).data().level) + 1
      next_arrows = $('i.fa').filter('[data-parent="' + parent + '"]').filter('[data-level="' + next_level + '"]')

      if next_arrows.length > 0
        if $(this).hasClass('fa-arrow-right')
          console.log('show')
          next_arrows.parent().slideDown 'fast'
        else
          next_arrows.parent().slideUp 'fast'
      if $(this).hasClass('fa-arrow-right')
        $(this).removeClass('fa-arrow-right').addClass('fa-arrow-up')
      else
        $(this).removeClass('fa-arrow-up').addClass('fa-arrow-right')

  showLevelOneArrows: ->
    $('i.fa').filter('[data-level="1"]').parent().show()


