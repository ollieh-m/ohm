class OHM.Words

  constructor: ->
    @contentArea = $('.about .section__words')
    @names = @contentArea.find('.name')
    @init()

  init: ->
    @showWordsOnClickingName()

  showWordsOnClickingName: ->
    @contentArea.find('.arrows').hide()
    contentArea = @contentArea

    @names.click (event) ->
      wordsShowing = contentArea.find('.words.showing')
      nameClicked = $(this)
      wordsToShow = nameClicked.next()
      arrows = nameClicked.find('span.arrows')

      wordsShowing.slideUp 'slow', ->
        $(this).removeClass 'showing'
        $(this).prev().find('span.arrows').hide()

      wordsShowing.promise().done ->
        wordsToShow.slideDown 'slow'
        wordsToShow.addClass 'showing'
        arrows.show()
