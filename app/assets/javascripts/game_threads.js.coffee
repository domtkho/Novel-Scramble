# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  endTime = new Date($('div.timer').data("end-time"))

  countDown = ->

    if endTime isnt null
      time_left = endTime - new Date
      if time_left <= 0
        if $('div.timer').data("phase") == "writing"
          $('.add-script').fadeOut('slow')
          $('input.vote-btn').fadeIn('slow')
          # $('input.switch-phase-btn').click()
          # countDown()
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



  # var update = function() { $('#countdown-time').text(new Date() - startTime); setTimeout(update, 50); }