## Simple demo of Rails 5 ActionCable based on [Pluralsight tutorial](https://www.pluralsight.com/guides/creating-a-chat-using-rails-action-cable)

### Brief flow of the application:
1. Visiting `/` of the app causes rendering of the messages stored in the db using `_message` partial
2. `cable.js` instantiates consumer websocket api and stores it in `App.cable`
3. `room.coffee` creates subscription to the `RoomChannel` websocket channel
4. It also creates handler for sending new messages which triggers `this.perform` sending `speak` message with content
5. Upon receiving `speak` message, server creates `Message` entity in the database with appended content
6. `after_create_commit` on `Message` model enqueues `MessageBroadcastJob`
7. Upon performing the job, it broadcast the received message, using `_message` partial, to the `room_channel`
8. `room.coffee` code handles the received data by invoking `received` handler and appending the message to the DOM
