Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'lobby#show'
  post '/host', to: 'lobby#host'
  post '/join', to: 'lobby#join'
  get '/game/:id', to: 'game#show', as: 'game'
  get '/player', to: 'game#player'
end
