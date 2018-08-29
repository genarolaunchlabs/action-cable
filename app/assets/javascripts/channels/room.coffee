App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log "you are connected"
    @install()

  disconnected: ->
    console.log "you are disconnected"

  received: (data) ->
    alert("You are mentioned by @"+ data.name) if data.mention
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()

    if data.typing
      $('.typing').text(data.username+' is typing...')
      setTimeout ( ->
        $('.typing').text('')
      ), 1000


  typing: ->
    @perform("typing")


  install: ->
    $(document).ready =>
      submit_message()
      scroll_bottom()

      $( "#message_content" ).keyup =>
        if $( "#message_content" ).val()
          console.log "typing"
          @typing()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey
      $('input').click()
      event.target.value = ""
      event.preventDefault()


