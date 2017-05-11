class OHM.Contact

  constructor: ->
    @setupNameVariables()
    @init()

  setupNameVariables: ->
    @nameArea = $('.name')
    @nameAssistanceTextArea = @nameArea.find('.assistance')
    @nameAssistanceInitialContent = @nameAssistanceTextArea.text()
    @nameResponseArea = @nameArea.find('.response-area')
    @nameBlinkingLine = @nameArea.find('.blinking-line')
    @nameInput = @nameArea.find('input#contact_form_name')

  init: ->
    @disableInput(@nameResponseArea)
    @giveInstruction(@nameAssistanceTextArea, @nameResponseArea)
    @nameBlinkingLine.addBlinkingLine()
    @setCursor(@nameInput)

  giveInstruction: (element, responseArea)->
    content = element.text()
    element.text('')
    element.css('display', 'inline')
    element.writeText(content)
      .then =>
        @enableInput(responseArea)

  # dealWithResponse: ->
  #   @responseArea.keypress (e)=>
  #     if e.which == 13
  #       entry = @navInput.val().toLowerCase()
  #       if entry != 'find out more' && entry != 'listen' && entry != 'get in touch'
  #         e.preventDefault()
  #         @disableInput()
  #         @giveInstruction('Sorry, can\'t help with that. Find out more // listen // get in touch?')

  setCursor: (input) ->
    input.css('width', '10px')
    input.keypress (e)=>
      if (e.which != 0 && e.charCode != 0 && e.which != 13)
        c = String.fromCharCode(e.keyCode|e.charCode)
        @resizeForText(input, c)
    input.keyup (e)=>
      if (e.keyCode == 8 || e.keyCode == 46)
        @resizeForText(input)

  # setHelpHover: ->
  #   @helpHover.hover(
  #     (e)=>
  #       console.log('display hover')
  #       $('#help-hover').css('display', 'inline')
  #     (e)=>
  #       $('#help-hover').hide()
  #   )


  resizeForText: (element, text='') ->
    span = element.siblings('span').first()
    span.text(element.val() + text)
    if span.width() > 0
      inputSize = span.width()
    else
      inputSize = '10px'
    element.css("width", inputSize)

  disableInput: (element) ->
    console.log('disable input')
    element.css('display', 'none')
    element.prop('disabled', true)

  enableInput: (element) ->
    console.log('enable input')
    element.css('display', 'inline')
    element.prop('disabled', false)

