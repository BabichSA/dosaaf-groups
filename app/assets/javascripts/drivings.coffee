# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

removeDriving = (hour, driving_id) ->
  student_id = $("#driving_student_id_#{hour}").val()
  unless student_id == "0"
    $.ajax
      type: "DELETE"
      url: "/drivings/#{driving_id}.json"
      success: (response) ->
        alert "Вождение отменено"
        $("#driving_student_id_#{hour}").val(0)
        $("#driving_student_id_#{hour}").selectpicker('refresh')
        setFormMode(hour, 'new', driving_id)
      error: (response) ->
        alert "ОШИБКА: Не удалось отменить вождение"

saveChangedDriving = (hour, driving_id) ->
  student_id = $("#driving_student_id_#{hour}").val()
  unless student_id == "0"
    $.ajax
      type: "PATCH"
      url: "/drivings/#{driving_id}.json"
      data:
        "driving":
          "student_id": student_id
      success: (response) ->
        alert "Вождение успешно обновлено"
      error: (response) ->
        alert "ОШИБКА: Не удалось обновить вождение"

addNewDriving = (hour) ->
  student_id = $("#driving_student_id_#{hour}").val()
  instructor_id = $("#simple_driving_instructor_id").val()
  driving_start_date = $('#simple_driving_date').datetimepicker('date').startOf('day').hours(hour).minutes(0).format("DD-MM-YYYY HH:mm")

  unless student_id == "0" || instructor_id == "0"
    $.ajax
      type: "POST"
      url: "/drivings.json"
      data:
        "driving":
          "instructor_id": instructor_id
          "student_id": student_id
          "start_date": driving_start_date
      success: (response) ->
        alert "Вождение успешно добавлено"
        setFormMode(hour, 'edit', response.id)
      error: (response) ->
        alert "ОШИБКА: Не удалось добавить вождение"

assignFindetDrivingToForm = (hour, student_id) ->
  $("#driving_student_id_#{hour}").val(student_id)
  $("#driving_student_id_#{hour}").selectpicker('refresh')

clearDrivingForm = (hour) ->
  $("#driving_student_id_#{hour}").val(0)
  $("#driving_student_id_#{hour}").selectpicker('refresh')

setFormMode = (hour, mode, driving_id) ->
  switch mode
    when 'new'
      $("#driving_btn_del_#{hour}").hide()
      $("#driving_student_id_#{hour}").removeAttr('disabled')
      $("#driving_student_id_#{hour}").selectpicker('refresh')
      
      $("#driving_student_id_#{hour}").unbind('changed.bs.select')
      $("#driving_student_id_#{hour}").on 'changed.bs.select', 
        (e, clickedIndex, isSelected, previousValue) -> addNewDriving(hour)
    when 'edit'
      $("#driving_btn_del_#{hour}").show()
      $("#driving_student_id_#{hour}").removeAttr('disabled')
      $("#driving_student_id_#{hour}").selectpicker('refresh')
      $("#driving_btn_del_#{hour}").unbind('click')
      $("#driving_btn_del_#{hour}").click (e) -> removeDriving(hour, driving_id)
      $("#driving_student_id_#{hour}").unbind('changed.bs.select')
      $("#driving_student_id_#{hour}").on 'changed.bs.select',
        (e, clickedIndex, isSelected, previousValue) -> saveChangedDriving(hour, driving_id)
    when 'readonly'
      $("#driving_btn_del_#{hour}").hide()
      $("#driving_student_id_#{hour}").attr('disabled', 'disabled')
      $("#driving_student_id_#{hour}").selectpicker('refresh')
    else
      $("#driving_btn_del_#{hour}").hide()
      $("#driving_student_id_#{hour}").removeAttr('disabled')
      $("#driving_student_id_#{hour}").selectpicker('refresh')

findDrivings = (instuctor_id, driving_start_date) ->
  url = "/drivings.json"
  
  driving_hours = [8, 10, 13, 15]
  if driving_start_date < moment()
    is_closed = true
  else
    is_closed = false
  
  $.each driving_hours, (i, driving_hour) ->
    driving_start = driving_start_date.hours(driving_hour).minutes(0).format("DD-MM-YYYY HH:mm")
    driving_end = driving_start_date.hours(driving_hour + 1).minutes(59).format("DD-MM-YYYY HH:mm")

    $.getJSON(
      url, (
        tags: "id instructor_id student_id start_date"
        tagmode: "any"
        format: "json"
        q: {
          utf8: '✓',
          instructor_id_eq: instuctor_id,
          start_date_gteq: driving_start
          start_date_lteq: driving_end
        }
      )
    )
    .done(
      (data) -> (
        if data.length > 0
          assignFindetDrivingToForm(driving_hour, data[0].student_id)
          if is_closed || instuctor_id == "0"
            setFormMode(driving_hour, 'readonly')
          else
            setFormMode(driving_hour, 'edit', data[0].id)
        else
          clearDrivingForm(driving_hour)
          if is_closed || instuctor_id == "0"
            setFormMode(driving_hour, 'readonly')
          else
            setFormMode(driving_hour, 'new')
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
    findDrivings($("#simple_driving_instructor_id").val(), start_date)
  
  $('#simple_driving_instructor_id').change (e)->
    start_date = $('#simple_driving_date').datetimepicker('date').startOf('day')
    findDrivings($(this).val(), start_date)

$(document).on 'turbolinks:load', -> pageInit()
