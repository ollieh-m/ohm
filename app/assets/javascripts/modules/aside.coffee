class OHM.Aside

  constructor: ->
    @asideArea = $('#aside')
    @init()

  init: ->
    $.ajax(
      url: '/aside',
    ).done( (data)=>
      @asideArea.html(data)
      @initNavTreeInteraction()
    );

  initNavTreeInteraction: ->
    @showSectionsWhenRightArrowClicked()

  showSectionsWhenRightArrowClicked: ->
    level_1_arrows = $('i.fa.fa-arrow-right').filter('[data-level="1"]')
    level_1_arrows.parent().show()
    level_1_arrows.click (e)->
      parent = $(this).data().parent
      level_2_arrows = $('i.fa.fa-arrow-right').filter('[data-parent="' + parent + '"]').filter('[data-level="2"]')
      if level_2_arrows.length > 0
        if $(this).hasClass('fa-arrow-right')
          level_2_arrows.parent().slideDown 'fast'
        else
          level_2_arrows.parent().slideUp 'fast'
      if $(this).hasClass('fa-arrow-right')
        $(this).removeClass('fa-arrow-right').addClass('fa-arrow-up')
      else
        $(this).removeClass('fa-arrow-up').addClass('fa-arrow-right')




