class OHM.Aside

  constructor: ->
    @asideArea = $('#aside')
    @init()

  init: ->
    $.ajax(
      url: '/aside',
    ).done( (data)=>
      @asideArea.html(data)
      console.log(data)
      @startingPositions()
      @initNavTreeInteraction()
    );

  initNavTreeInteraction: ->
    _this = this
    arrows = $('i.fa')
    arrows.click (e)->
      parent = $(this).next().text()
      next_level = Number($(this).data().level) + 1
      _this.expand(parent, next_level, $(this).hasClass('fa-arrow-right'))
      _this.switchArrows($(this))

  expand: (parent, next_level, makeChange=false) ->
    next_arrows = $('i.fa').filter('[data-parent="' + parent + '"]').filter('[data-level="' + next_level + '"]')

    if next_arrows.length > 0
      if makeChange
        next_arrows.parent().slideDown 'fast'
      else
        next_arrows.parent().slideUp 'fast'

  switchArrows: (node) ->
    if node.hasClass('fa-arrow-right')
      node.removeClass('fa-arrow-right').addClass('fa-arrow-up')
    else
      node.removeClass('fa-arrow-up').addClass('fa-arrow-right')

  startingPositions: ->
    url = window.location.href
    path = url.substring(url.lastIndexOf('/'))
    unless path == '/'
      nav_link_h1= $('a[href="' + path + '"]').parent()
      nav_link_h1.addClass('selected')
      nav_link_arrow = nav_link_h1.prev()

      parent = nav_link_arrow.data().parent
      next_level = nav_link_arrow.data().level
      unless next_level == 1
        @expandParentsRecursively(parent, next_level)

    $('i.fa').filter('[data-level="1"]').parent().show()

  expandParentsRecursively: (parent, next_level, stop=false) ->
    @expand(parent, next_level, true)
    new_parent_node = $("div.page__title:contains('#{parent}')").find('i')
    new_parent_node.removeClass('fa-arrow-right').addClass('fa-arrow-up')
    return if stop
    @expandParentsRecursively(new_parent_node.data().parent, new_parent_node.data().level, new_parent_node.data().parent == parent)


