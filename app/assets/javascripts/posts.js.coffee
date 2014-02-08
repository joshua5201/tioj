# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('div.new_comment_form').hide()
    $('button.new_comment').click ->
        $(this).siblings("div").toggle()
        if $(this).text() == "New Comment"
            $(this).text("Hide Form")
        else
            $(this).text("New Comment")



