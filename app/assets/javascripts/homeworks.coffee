# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pageInit = ->
  $ -> $('#homework_assigned_at').datetimepicker
    # defaultDate: moment().hour(8).minute(0)
    format: 'YYYY-MM-DD'
    icons: time: 'fa fa-clock'

$(document).on 'turbolinks:load', -> pageInit()