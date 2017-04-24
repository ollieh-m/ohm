class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('.nav__header__assistance')
    @initialContent = @assistantTextArea.text()
    @blinkingLine = @contentArea.find('.nav__header__blinking-line')
    @responseArea = @contentArea.find('.nav__form_response-area')
    @navInput = @responseArea.find('input#nav_to')
    @helpHover = @responseArea.find('label')
    @init()

  init: ->
    @disableInput()
    @giveInstruction(@initialContent)
    @blinkingLine.addBlinkingLine()
    @dealWithResponse()
    @setCursor()
    @setHelpHover()

  giveInstruction: (content)->
    @assistantTextArea.text('')
    @assistantTextArea.css('display', 'inline')
    @assistantTextArea.writeText(content)
      .then =>
        @enableInput()

  dealWithResponse: ->
    @responseArea.keypress (e)=>
      if e.which == 13
        entry = @navInput.val().toLowerCase()
        if entry != 'find out more' && entry != 'listen' && entry != 'get in touch'
          e.preventDefault()
          @disableInput()
          @giveInstruction('Sorry, can\'t help with that. Find out more // listen // get in touch?')

  setCursor: ->
    @navInput.css('width', '10px')
    @navInput.keypress (e)=>
      if (e.which != 0 && e.charCode != 0 && e.which != 13)
        c = String.fromCharCode(e.keyCode|e.charCode)
        @resizeForText(@navInput, c)
    @navInput.keyup (e)=>
      if (e.keyCode == 8 || e.keyCode == 46)
        @resizeForText(@navInput)

  setHelpHover: ->
    @helpHover.hover(
      (e)=>
        console.log('display hover')
        $('#help-hover').css('display', 'inline')
      (e)=>
        $('#help-hover').hide()
    )


  resizeForText: (element, text='') ->
    span = element.siblings('span').first()
    span.text(element.val() + text)
    if span.width() > 0
      inputSize = span.width()
    else
      inputSize = '10px'
    element.css("width", inputSize)

  disableInput: ->
    console.log('disable input')
    @responseArea.css('display', 'none')
    @responseArea.prop('disabled', true)

  enableInput: ->
    console.log('enable input')
    @responseArea.css('display', 'inline')
    @responseArea.prop('disabled', false)

