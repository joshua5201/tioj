# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $("#quick_submit").click ->
        prob_id = $('#quick_prob_id').val()
        if prob_id == ""
            return

        window.location.href = "/problems/#{prob_id}/submissions/new"
