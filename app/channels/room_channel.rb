class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    stream_from "room_channel_user_#{message_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def typing
  	User.exclude(message_user.id).each do |user|
      ActionCable.server.broadcast "room_channel_user_#{user.id}", { channel: "RoomChannel", username: message_user.username, typing: true }
    end
  end
end
