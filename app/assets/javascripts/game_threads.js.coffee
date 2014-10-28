# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  startTime = new Date()
  write_timer_length = $("div.timer").data("write-phase-length")
  vote_timer_length = $("div.timer").data("vote-phase-length")

  writeCountDown = ->

    lapseTime = new Date() - startTime
    time_left = write_timer_length - lapseTime
    if time_left < 0
      $('.add-script').fadeOut('slow')
      $('input.vote-btn').fadeIn('slow')
      startTime = new Date()
      voteCountDown()

    minutes = Math.floor(time_left / (1000 * 60))
    seconds = Math.floor((time_left - (minutes * 1000 * 60))/1000)
    milliseconds = (time_left - (minutes * 1000 * 60) - (seconds * 1000))

    $('#countdown-time-min').text("#{minutes} min")
    $('#countdown-time-sec').text("#{seconds} sec")
    $('#countdown-time-milli').text("#{milliseconds}")
    setTimeout(writeCountDown, 10)


  voteCountDown = ->

    lapseTime = new Date() - startTime
    time_left = vote_timer_length - lapseTime
    if time_left < 0
      $('input.next-round-btn').click()
      $('#countdown-time-min').text("0 min")
      $('#countdown-time-sec').text("0 sec")
      $('#countdown-time-milli').text("0")

    minutes = Math.floor(time_left / (1000 * 60))
    seconds = Math.floor((time_left - (minutes * 1000 * 60))/1000)
    milliseconds = (time_left - (minutes * 1000 * 60) - (seconds * 1000))

    $('#countdown-time-min').text("#{minutes} min")
    $('#countdown-time-sec').text("#{seconds} sec")
    $('#countdown-time-milli').text("#{milliseconds}")

    setTimeout(voteCountDown, 10)



   writeCountDown()



  # var update = function() { $('#countdown-time').text(new Date() - startTime); setTimeout(update, 50); }