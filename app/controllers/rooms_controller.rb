class RoomsController < ApplicationController

  # action no fetch all messages for the chat room endpoint
  def show
    @messages = Message.all
  end
end
