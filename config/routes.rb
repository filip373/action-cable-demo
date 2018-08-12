Rails.application.routes.draw do
  # main view for chatrooms
  root to: 'rooms#show'

  # serve websocket requests in the current application
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
