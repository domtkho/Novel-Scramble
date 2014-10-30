# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.game_threads_index_js = ->
  thread_id = $('div.script-pane').data("game-thread-id")

  pollGameRoomTable = ->
    $.get("/room_table_pane").done (data) ->
      $('div.room-table-pane').html(data)
      setTimeout(pollGameRoomTable, 1000)

  pollGameRoomTable()

window.game_threads_show_js = ->

  thread_id = $('div.script-pane').data("game-thread-id")

  pollPhase = ->
    $.get("/game_threads/#{thread_id}.json").done (data) ->
      if data.phase is 'waiting'
        $('div.waiting-message-container').fadeIn('slow')
      else
      # if endTime isnt null
        $('div.waiting-message-container').fadeOut('slow')
        $('div.timer').fadeIn('slow')
        $('div.timer').data('end-time', data.round_end_time)
      setTimeout(pollPhase, 500)

  pollScriptPane = ->
    $.get("/game_threads/#{thread_id}/script_pane").done (data) ->
      $('div.script-pane').html(data)
      setTimeout(pollScriptPane, 500)

  pollWriterPane = ->
    $.get("/game_threads/#{thread_id}/writer_pane").done (data) ->
      $('div.writer-pane').html(data)
      setTimeout(pollWriterPane, 500)

  # $('.join-game-button').click (event) ->
  #   event.preventDefault
  #   $.post("/game_threads/#{thread_id}/add_writer.json").done (data) ->
  #     $('div.writer-pane').html(data)

  # $.post("/game_threads/#{thread_id}/remove_writer.json").done (data) ->
  #   $('div.writer-pane').html(data)

  countDown = ->

    endTime = new Date($('div.timer').data("end-time"))
    time_left = new Date(endTime - new Date).getTime()

    if time_left <= 0
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

  pollWriterPane()
  pollScriptPane()
  countDown()
  pollPhase()
  # pollTimerPane = ->
  #   $.get("/game_threads/#{thread_id}/timer_pane").done (data) ->
  #     $('div.timer-pane').html(data)
  #     setTimeout(pollTimerPane, 500)

# pollTimerPane()
