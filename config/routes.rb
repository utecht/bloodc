Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'lobby#show'
  post '/host', to: 'lobby#host'
  post '/join', to: 'lobby#join'
  get '/game', to: 'game#show', as: 'game'
  get '/player', to: 'game#player', as: 'player'
  post '/lock', to: 'game#lock'
  post '/start', to: 'game#start'
  patch '/assign/:id', to: 'game#assign', as: 'assign'
  patch '/update/:id', to: 'game#update', as: 'update'
  get '/roles', to: 'game#all_roles', as: 'all_roles'
end
