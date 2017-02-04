class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('#assistance')
    @initialContent = @assistantTextArea.text()
    @responseArea = @contentArea.find('input')
    @blinkingLine = @contentArea.find('#blinking-line')
    @init()

  init: ->
    @giveInstruction(@initialContent)
    @blinkingLine.addBlinkingLine()
    @dealWithResponse()

  giveInstruction: (content)->
    @assistantTextArea.text('')
    @assistantTextArea.css('display', 'inline-block')
    @assistantTextArea.writeText(content, @triggerBlinkingLine)

  dealWithResponse: ->
    @responseArea.keypress (e)=>
      if e.which == 13
        entry = @responseArea.val().toLowerCase()
        if entry == 'code' || entry == 'music'
          console.log('Trigger request for the corresponding page');
        else
          @giveInstruction('Sorry, can\'t help with that. Code, or music?')
