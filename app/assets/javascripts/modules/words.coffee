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

      wordsShowing.slideUp 'slow', ->
        $(this).removeClass 'showing'
        name = $(this).prev()
        name.removeClass 'showing'
        name.find('span.arrows').hide()

      wordsShowing.promise().done ->
        nameClicked.addClass 'showing'
        wordsToShow.slideDown 'slow'
        wordsToShow.addClass 'showing'
        nameClicked.find('span.arrows').show()
