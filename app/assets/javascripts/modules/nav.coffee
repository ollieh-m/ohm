class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('.nav__header__assistance')
    @initialContent = @assistantTextArea.text()
    @responseArea = @contentArea.find('.nav__form_response-area')
    @blinkingLine = @contentArea.find('.nav__header__blinking-line')
    @init()

  init: ->
    @disableInput()
    @giveInstruction(@initialContent)
    @blinkingLine.addBlinkingLine()
    @dealWithResponse()
    # set cursor to follow input

  giveInstruction: (content)->
    @assistantTextArea.text('')
    @assistantTextArea.css('display', 'inline')
    @assistantTextArea.writeText(content)
      .then =>
        @enableInput()

  dealWithResponse: ->
    @responseArea.keypress (e)=>
      if e.which == 13
        entry = @responseArea.find('input#nav_to').val().toLowerCase()
        if entry != 'find out more' && entry != 'listen' && entry != 'get in touch'
          e.preventDefault()
          @disableInput()
          @giveInstruction('Sorry, can\'t help with that. Find out more // listen // get in touch?')

  disableInput: ->
    console.log('disable input')
    @responseArea.css('display', 'none')
    @responseArea.prop('disabled', true)

  enableInput: ->
    console.log('enable input')
    @responseArea.css('display', 'inline')
    @responseArea.prop('disabled', false)

