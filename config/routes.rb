Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  delete "/teams", to: 'teams#destroy'

  get '/teams/:id', to: 'teams#show'
  get '/teams/:team_id/members', to: 'team_members#index'
  get '/teams/:id/edit', to: 'teams#edit'
  post '/teams/:id/edit', to: 'teams#edit'
  patch 'teams/:id', to: 'teams#update'
  post "/teams/:id/delete", to: 'teams#destroy'

  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'
  get '/teams/:team_id/members/new', to: 'team_members#new'
  post '/teams/:team_id/members', to: 'team_members#create_member'
  get '/members/:id/edit', to: 'members#edit'
  post '/members/:id/edit', to: 'members#edit'
  patch '/members/:id', to: 'members#update'
end
