ready = ->
  console.log('loading modules')
  new OHM.Nav()
  new OHM.Words()
  new OHM.Contact()
  new OHM.Aside()

$(document).on('turbolinks:load', ready)
