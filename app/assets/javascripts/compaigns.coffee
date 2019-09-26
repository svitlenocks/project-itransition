# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.support').click (event) ->
    $(this).hide()
    $(this).next().removeClass 'form-hide'
    return
  return

$(document).on 'turbolinks:load', ->
    simplemde = new SimpleMDE()
    