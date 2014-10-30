# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  endTime = new Date($('div.timer').data("end-time"))
  thread_id = $('div.script-pane').data("game-thread-id")

  pullData = ->
    $.get("/game_threads/#{thread_id}/script_pane").done (data) ->
      $('div.script-pane').html(data)
      setTimeout(pullData, 500)

  countDown = ->

    if $('div.timer').data("end-time") isnt "waiting"
    # if endTime isnt null
      time_left = new Date(endTime - new Date).getTime()

      if time_left <= 0

        # if ["preparation", "writing", "reading"].include?($('div.timer').data("phase"))

        if ($('div.timer').data("phase") == "preparation") || ($('div.timer').data("phase") == "writing")
          $('input.switch-phase-btn').click()
        else
          $('input.next-round-btn').click()


      else
        minutes = Math.floor(time_left / (1000 * 60))
        seconds = Math.floor((time_left - (minutes * 1000 * 60))/1000)
        milliseconds = (time_left - (minutes * 1000 * 60) - (seconds * 1000))

        $('#countdown-time-min').text("#{minutes} min")
        $('#countdown-time-sec').text("#{seconds} sec")
        $('#countdown-time-milli').text("#{milliseconds}")
        setTimeout(countDown, 10)

  countDown()
  pullData()



  # var update = function() { $('#countdown-time').text(new Date() - startTime); setTimeout(update, 50); }