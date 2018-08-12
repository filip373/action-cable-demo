class Message < ApplicationRecord

  # we want to broadcast a message after pesisting it in the database
  after_create_commit { MessageBroadcastJob.perform_later self }
end
