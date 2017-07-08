# == Route Map
#
#                                Prefix Verb     URI Pattern                                  Controller#Action
#                      new_user_session GET      /users/sign_in(.:format)                     devise/sessions#new
#                          user_session POST     /users/sign_in(.:format)                     devise/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                    devise/sessions#destroy
#      user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)               omniauth_callbacks#passthru
#       user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)      omniauth_callbacks#facebook
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)          omniauth_callbacks#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format) omniauth_callbacks#google_oauth2
#                     new_user_password GET      /users/password/new(.:format)                devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)               devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                    devise/passwords#update
#                                       PUT      /users/password(.:format)                    devise/passwords#update
#                                       POST     /users/password(.:format)                    devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                      registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                     registrations#new
#                edit_user_registration GET      /users/edit(.:format)                        registrations#edit
#                     user_registration PATCH    /users(.:format)                             registrations#update
#                                       PUT      /users(.:format)                             registrations#update
#                                       DELETE   /users(.:format)                             registrations#destroy
#                                       POST     /users(.:format)                             registrations#create
#                         comments_show GET      /comments/show(.:format)                     comments#show
#                              comments GET      /comments(.:format)                          comments#index
#                                       POST     /comments(.:format)                          comments#create
#                           new_comment GET      /comments/new(.:format)                      comments#new
#                          edit_comment GET      /comments/:id/edit(.:format)                 comments#edit
#                               comment PATCH    /comments/:id(.:format)                      comments#update
#                                       PUT      /comments/:id(.:format)                      comments#update
#                                       DELETE   /comments/:id(.:format)                      comments#destroy
#                       events_calendar GET      /events/calendar(.:format)                   events#calendar
#                                events GET      /events(.:format)                            events#index
#                                       POST     /events(.:format)                            events#create
#                             new_event GET      /events/new(.:format)                        events#new
#                            edit_event GET      /events/:id/edit(.:format)                   events#edit
#                                 event GET      /events/:id(.:format)                        events#show
#                                       PATCH    /events/:id(.:format)                        events#update
#                                       PUT      /events/:id(.:format)                        events#update
#                                       DELETE   /events/:id(.:format)                        events#destroy
#                         user_mentions GET      /user/mentions(.:format)                     user#mentions
#                            user_index GET      /user(.:format)                              user#index
#                                       POST     /user(.:format)                              user#create
#                              new_user GET      /user/new(.:format)                          user#new
#                             edit_user GET      /user/:id/edit(.:format)                     user#edit
#                                  user GET      /user/:id(.:format)                          user#show
#                                       PATCH    /user/:id(.:format)                          user#update
#                                       PUT      /user/:id(.:format)                          user#update
#                                       DELETE   /user/:id(.:format)                          user#destroy
#                            votes_like POST     /votes/like(.:format)                        votes#create
#                          votes_unlike DELETE   /votes/unlike(.:format)                      votes#destroy
#                                 votes GET      /votes(.:format)                             votes#index
#                                       POST     /votes(.:format)                             votes#create
#                              new_vote GET      /votes/new(.:format)                         votes#new
#                             edit_vote GET      /votes/:id/edit(.:format)                    votes#edit
#                                  vote GET      /votes/:id(.:format)                         votes#show
#                                       PATCH    /votes/:id(.:format)                         votes#update
#                                       PUT      /votes/:id(.:format)                         votes#update
#                                       DELETE   /votes/:id(.:format)                         votes#destroy
#                         venues_search GET      /venues/search(.:format)                     venues#search
#                                venues GET      /venues(.:format)                            venues#index
#                                       POST     /venues(.:format)                            venues#create
#                             new_venue GET      /venues/new(.:format)                        venues#new
#                            edit_venue GET      /venues/:id/edit(.:format)                   venues#edit
#                                 venue GET      /venues/:id(.:format)                        venues#show
#                                       PATCH    /venues/:id(.:format)                        venues#update
#                                       PUT      /venues/:id(.:format)                        venues#update
#                                       DELETE   /venues/:id(.:format)                        venues#destroy
#                                  root GET      /                                            visitors#index
#                                  page GET      /pages/*id                                   high_voltage/pages#show
# 

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  # post '/comments/create/:commentable_type/:commentable_id/:user_id', to: 'comments#create'
  get 'comments/show', controller: :comments
  resources :comments, except: :show

  get 'events/calendar', controller: :events
  resources :events

  get 'user/mentions', controller: :user
  resources :user

  # post '/votes/like/:votable_type/:votable_id/:user_id', to: 'votes#create' # like
  # delete '/votes/unlike/:votable_type/:votable_id/:user_id', to: 'votes#destroy' # unlike
  post '/votes/like', to: 'votes#create' # like
  delete '/votes/unlike', to: 'votes#destroy' # unlike
  resources :votes

  get 'venues/search', controller: :venues
  resources :venues

  root to: 'visitors#index'
end
