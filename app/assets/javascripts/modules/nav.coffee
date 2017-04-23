class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('#assistance')
    @initialContent = @assistantTextArea.text()
    @responseArea = @contentArea.find('input#nav_to')
    @blinkingLine = @contentArea.find('#blinking-line')
    @init()

  init: ->
    @disableInput()
    @giveInstruction(@initialContent)
    @blinkingLine.addBlinkingLine()
    @dealWithResponse()

  giveInstruction: (content)->
    @assistantTextArea.text('')
    @assistantTextArea.css('display', 'inline-block')
    @assistantTextArea.writeText(content)
      .then =>
        @enableInput()

  dealWithResponse: ->
    @responseArea.keypress (e)=>
      if e.which == 13
        entry = @responseArea.val().toLowerCase()
        if entry != 'find out more' && entry != 'listen' && entry != 'get in touch'
          e.preventDefault()
          @disableInput()
          @giveInstruction('Sorry, can\'t help with that. Find out more // listen // get in touch?')

  disableInput: ->
    console.log('disable input')
    @responseArea.prop('disabled', true)

  enableInput: ->
    console.log('enable input')
    @responseArea.prop('disabled', false)

