# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

findDriving = (instuctor_id, driving_date) ->
  # :id, :instructor_id, :student_id, :start_date, :created_at, :updated_at
  url = "/drivings.json"

  $.getJSON(
    url, (
      tags: "id instructor_id student_id start_date"
      tagmode: "any"
      format: "json"
      q: {
        instructor_id_eq: instuctor_id,
        start_date_gteq: driving_date,
        start_date_lteq: driving_date,
        greed_material_id_eq: material,
      }
    )
  )

pageInit = ->
  $ -> $('#driving_start_date').datetimepicker
    defaultDate: moment().hour(8).minute(0)
    format: 'YYYY-MM-DD HH:mm Z'
    icons: time: 'fa fa-clock'

  $ -> $('#simple_driving_date').datetimepicker
    locale: 'ru'
    format: 'YYYY/MM/DD'
    inline: true

  $('#simple_driving_date').on 'change.datetimepicker', (e)->
    console.log $(this).datetimepicker('date')

  $('#simple_driving_instructor_id').change (e)->
    console.log $(this).val()

$(document).on 'turbolinks:load', -> pageInit()
