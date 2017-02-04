class OHM.Nav

  constructor: ->
    @contentArea = $('nav div')
    @assistantTextArea = @contentArea.find('h2')
    @content = @assistantTextArea.text()
    @init()

  init: ->

    @assistantTextArea.text('')
    @assistantTextArea.show()
    @assistantTextArea.writeText(@content, @triggerBlinkingLine)

  triggerBlinkingLine: (elem)->
    elem.addBlinkingLine()
