jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

$(document).on 'turbolinks:load', ->
  $(window).trigger 'load.bs.select.data-api'
