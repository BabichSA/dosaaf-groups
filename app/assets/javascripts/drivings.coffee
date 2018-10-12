# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

AssignFindetDrivingToForm = (drivings_json) ->
  # console.log drivings_json
  if drivings_json.length > 0
    $.each(drivings_json, (i, item) ->
      # console.log item
    )

findDriving = (instuctor_id, driving_start_date, driving_end_date) ->
  # :id, :instructor_id, :student_id, :start_date, :created_at, :updated_at
  url = "/drivings.json"

  # console.log $("#driving_student_id_8_00").val() console.log
  $("#driving_student_id_8_00").val(81)
  $("#driving_student_id_8_00").selectpicker('refresh')
  
  $.getJSON(
    url, (
      tags: "id instructor_id student_id start_date"
      tagmode: "any"
      format: "json"
      q: {
        utf8: '✓',
        instructor_id_eq: instuctor_id,
        start_date_gteq: driving_start_date.format("DD-MM-YYYY HH:mm")
        start_date_lteq: driving_end_date.format("DD-MM-YYYY HH:mm")
      }
    )
  )
  .done(
    (data) -> (
      AssignFindetDrivingToForm data
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
    start_date = $(this).datetimepicker('viewDate').startOf('day')
    end_date = $(this).datetimepicker('viewDate').endOf('day')
    findDriving($("#simple_driving_instructor_id").val(), start_date, end_date)
  
  $('#simple_driving_instructor_id').change (e)->
    start_date = $('#simple_driving_date').datetimepicker('date').startOf('day')
    end_date = $('#simple_driving_date').datetimepicker('date').endOf('day')
    findDriving($(this).val(), start_date, end_date)

$(document).on 'turbolinks:load', -> pageInit()
