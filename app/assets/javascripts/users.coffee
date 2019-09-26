# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#check_all').on 'click', ->
    cbxs = $('input[type="checkbox"]')
    cbxs.prop 'checked', !cbxs.prop('checked')
    if cbxs.prop('checked') then $('#check_all').text('Uncheck all') else $('#check_all').text('Check all')
    false
  return