App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log "you are connected"

  disconnected: ->
    console.log "you are disconnected"

  received: (data) ->
    alert("You are mentioned by @"+ data.name) if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()

$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)