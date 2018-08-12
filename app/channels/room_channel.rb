class RoomChannel < ApplicationCable::Channel

  # #subscribed method is called whenever a client connects to a channel
  def subscribed

    # we are broadcasting messages from room_channel
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # custom method to receive data from client side
  def speak(data)
    Message.create! content: data['message']
  end
end
