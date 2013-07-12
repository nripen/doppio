# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ()->
  $("form.new_project").on "ajax:success", (event, data, status, xhr) ->
    $("form.new_project")[0].reset()
    $('#new-project-modal').modal('hide')
    $('#error_explanation').hide()

  $("form.new_project").on "ajax:error", (event, xhr, status, error) ->
    console.log 'helllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll'
    errors = jQuery.parseJSON(xhr.responseText)
    errorcount = errors.length
    console.log errorcount
    $('#error_explanation').empty()
    if errorcount > 1
      $('#error_explanation').append('<div class="alert alert-error">The form contains ' + errorcount + ' errors.</div>')
    else
      $('#error_explanation').append('<div class="alert alert-error">The form contains 1 error</div>')
    $('#error_explanation').append('<ul>')
    for e in errors
      $('#error_explanation').append('<li>' + e + '</li>')
    $('#error_explanation').append('</ul>')
    $('#error_explanation').show()

