class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "posts_channel"
    stream_from "posts_channel_user_#{message_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
