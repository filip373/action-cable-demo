# the client subscribes to the server by the following method
App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server - default

  disconnected: ->
    # Called when the subscription has been terminated by the server - default

  received: (data) ->
    alert(data['message'])
    # Called when there's incoming data on the websocket for this channel - default

  # speak method sends a message to the server
  speak: (message) ->
    @perform 'speak', message: message

# when writing something in the textbox and pressing enter, it will call the speak function
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return/enter = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
