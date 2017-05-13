class OHM.Contact

  constructor: ->
    @setupNameVariables()
    @setupEmailVariables()
    @setupMessageVariables()
    @setupSubmitVariables()
    @init()

  setupNameVariables: ->
    @nameArea = $('.name')
    @nameAssistanceTextArea = @nameArea.find('.assistance')
    @nameResponseArea = @nameArea.find('.response-area')
    @nameBlinkingLine = @nameArea.find('.blinking-line')
    @nameInput = @nameArea.find('input#contact_form_name')

  setupEmailVariables: ->
    @emailArea = $('.email')
    @emailAssistanceTextArea = @emailArea.find('.assistance')
    @emailResponseArea = @emailArea.find('.response-area')
    @emailBlinkingLine = @emailArea.find('.blinking-line')
    @emailInput = @emailArea.find('input#contact_form_email')

  setupMessageVariables: ->
    @messageArea = $('.message')
    @messageAssistanceTextArea = @messageArea.find('.assistance')
    @messageResponseArea = @messageArea.find('.response-area')
    @messageBlinkingLine = @messageArea.find('.blinking-line')
    @messageInput = @messageArea.find('input#contact_form_message')

  setupSubmitVariables: ->
    @submitArea = $('.submit')
    @submitAssistanceTextArea = @submitArea.find('.assistance')
    @submitResponseArea = @submitArea.find('.response-area')
    @submitBlinkingLine = @submitArea.find('.blinking-line')
    @submitInput = @submitArea.find('input#contact_form_submit')

  init: ->
    @initName()

  initName: ->
    @nameArea.css('display', 'block')
    @disableInput(@nameResponseArea)
    @giveInstruction(@nameAssistanceTextArea, @nameResponseArea)
    @nameBlinkingLine.addBlinkingLine()
    @setCursor(@nameInput)
    @dealWithResponse(@nameResponseArea, @nameAssistanceTextArea)

  initEmail: ->
    @emailArea.css('display', 'block')
    @disableInput(@emailResponseArea)
    @giveInstruction(@emailAssistanceTextArea, @emailResponseArea)
    @emailBlinkingLine.addBlinkingLine()
    @setCursor(@emailInput)
    @dealWithResponse(@emailResponseArea, @emailAssistanceTextArea)

  initMessage: ->
    @messageArea.css('display', 'block')
    @disableInput(@messageResponseArea)
    @giveInstruction(@messageAssistanceTextArea, @messageResponseArea)
    @messageBlinkingLine.addBlinkingLine()
    @dealWithMessageInput()

  initSubmit: ->
    @submitArea.css('display', 'block')
    @disableInput(@submitResponseArea)
    @giveInstruction(@submitAssistanceTextArea, @submitResponseArea, false, false)
    @submitBlinkingLine.addBlinkingLine()
    @setCursor(@submitInput)
    @dealWithSubmit(@submitResponseArea, @submitAssistanceTextArea)
    @submitResponseArea.addClass('complete')

  initNextField: ->
    if @nameResponseArea.hasClass('complete') && !@emailResponseArea.hasClass('complete') && !@messageResponseArea.hasClass('complete')
      @initEmail()
    else if @nameResponseArea.hasClass('complete') && @emailResponseArea.hasClass('complete') && !@messageResponseArea.hasClass('complete')
      @initMessage()
    else if @nameResponseArea.hasClass('complete') && @emailResponseArea.hasClass('complete') && @messageResponseArea.hasClass('complete') && !@submitResponseArea.hasClass('complete')
      @initSubmit()

  giveInstruction: (assistanceArea, responseArea, customMessage=null, focus=true)->
    content = customMessage || assistanceArea.text()
    assistanceArea.text('')
    assistanceArea.css('display', 'inline')
    assistanceArea.writeText(content)
      .then =>
        return @enableInput(responseArea, focus)

  dealWithResponse: (responseArea, assistanceArea) ->
    responseArea.keypress (e)=>
      if e.which == 13
        e.preventDefault()
        entry = responseArea.find('input').val().toLowerCase()
        title = responseArea.data().title
        if responseArea.data().required && entry == ''
          @disableInput(responseArea)
          @giveInstruction(assistanceArea, responseArea, "can't be blank I'm afraid - please enter your #{responseArea.data().title}")
        else if responseArea.data().type == 'email' && !/\S+@\S+\.\S+/.test(entry)
          @disableInput(responseArea)
          @giveInstruction(assistanceArea, responseArea, "that's not a valid email address - please enter your #{responseArea.data().title}")
        else
          responseArea.addClass('complete')
          @initNextField()

  dealWithMessageInput: ->
    @messageResponseArea.keypress (e)=>
      @messageResponseArea.addClass('complete')
      @initNextField()

  dealWithSubmit: ->
    @submitResponseArea.keypress (e)=>
      if e.which == 13
        e.preventDefault()
        entry = @submitResponseArea.find('input').val().toLowerCase()
        if entry == ''
          @disableInput(@submitResponseArea)
          @giveInstruction(@submitAssistanceTextArea, @submitResponseArea, "tell me what to do")
        else
          @giveInstruction(@submitAssistanceTextArea, @submitResponseArea, "sure! #{entry}ing now...")
            .then =>
              setTimeout ->
                $('form.new_contact_form').submit()
              , 1000



  setCursor: (input) ->
    input.css('width', '10px')
    input.keypress (e)=>
      if (e.which != 0 && e.charCode != 0 && e.which != 13)
        c = String.fromCharCode(e.keyCode|e.charCode)
        @resizeForText(input, c)
    input.keyup (e)=>
      if (e.keyCode == 8 || e.keyCode == 46)
        @resizeForText(input)

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

  enableInput: (element, focus) ->
    console.log('enable input')
    element.css('display', 'inline')
    element.prop('disabled', false)
    if focus
      element.find('input, textarea').focus()


