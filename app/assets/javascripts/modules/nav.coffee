class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('h2')
    @init()

  init: ->
    @assistantTextArea.writeText('Hello, ', @triggerBlinkingLine)

  triggerBlinkingLine: (elem)->
    elem.addBlinkingLine()
