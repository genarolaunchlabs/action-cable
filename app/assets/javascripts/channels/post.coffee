App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->
    console.log "you are connected to post channel"

  disconnected: ->
    console.log "you are disconnected to post channel"

  received: (data) ->
  	if (data.post && !data.post.blank?)
      $('.posts').prepend data.post

      user_id = $('.posts').data("id")

      if user_id != data.user_id
        $('.posts #id'+data.id+' .deletePost').remove()


    if (data.post_id && !data.post_id.blank?)
      $('#'+data.post_id).remove()