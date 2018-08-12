class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)

    # broadcast the message to the room_channel using format defined in render_message method
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message(message)

    # we can use renderer outside of the controller to render message in the desired partial template
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
