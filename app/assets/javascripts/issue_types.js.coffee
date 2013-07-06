# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
console.log 'jjdfkajkj'
$ ()->
  $("form.new_issue_type").on "ajax:success", (event, data, status, xhr) ->
    $('#new_issue_modal').modal('hide')
    $console.log 'hhhehheheeheh'
    



