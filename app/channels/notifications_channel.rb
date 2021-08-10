class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'all_notifications'
    ActionCable.server.broadcast('all_notifications', {
      user: current_user,
      message: 'has joined'
    })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def typing
    ActionCable.server.broadcast('all_notifications', {
      user: current_user,
      message: "is typing"
    })
  end
end
