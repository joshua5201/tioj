# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#lmenu').hide()
    $('#unfold').click -> 
        $('#unfold').hide()
        $('#lmenu').show()
    $('#fold').click ->
        $('#lmenu').hide()
        $('#unfold').show()

