Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  
  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show'
  get '/teams/:team_id/members', to: 'team_members#index'
  post '/teams/:id/edit', to: 'teams#edit'
  post 'teams/:id', to: 'teams#update'

  get '/members', to: 'members#index'
  get '/members/:id', to: 'members#show'
  get '/teams/:team_id/members/new', to: 'team_members#new'
  post '/teams/:team_id/members', to: 'team_members#create_member'
end
