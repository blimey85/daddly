# == Route Map
#
#                                Prefix Verb     URI Pattern                                  Controller#Action
#                         comments_show GET      /comments/show(.:format)                     comments#show
#                              comments GET      /comments(.:format)                          comments#index
#                                       POST     /comments(.:format)                          comments#create
#                           new_comment GET      /comments/new(.:format)                      comments#new
#                          edit_comment GET      /comments/:id/edit(.:format)                 comments#edit
#                               comment PATCH    /comments/:id(.:format)                      comments#update
#                                       PUT      /comments/:id(.:format)                      comments#update
#                                       DELETE   /comments/:id(.:format)                      comments#destroy
#                         mailbox_inbox GET      /mailbox/inbox(.:format)                     mailbox#inbox
#                          mailbox_sent GET      /mailbox/sent(.:format)                      mailbox#sent
#                         mailbox_trash GET      /mailbox/trash(.:format)                     mailbox#trash
#                         mailbox_index GET      /mailbox(.:format)                           mailbox#index
#                    reply_conversation POST     /conversations/:id/reply(.:format)           conversations#reply
#                    trash_conversation POST     /conversations/:id/trash(.:format)           conversations#trash
#                  untrash_conversation POST     /conversations/:id/untrash(.:format)         conversations#untrash
#                         conversations GET      /conversations(.:format)                     conversations#index
#                                       POST     /conversations(.:format)                     conversations#create
#                      new_conversation GET      /conversations/new(.:format)                 conversations#new
#                     edit_conversation GET      /conversations/:id/edit(.:format)            conversations#edit
#                          conversation GET      /conversations/:id(.:format)                 conversations#show
#                                       PATCH    /conversations/:id(.:format)                 conversations#update
#                                       PUT      /conversations/:id(.:format)                 conversations#update
#                                       DELETE   /conversations/:id(.:format)                 conversations#destroy
#                       events_calendar GET      /events/calendar(.:format)                   events#calendar
#                                events GET      /events(.:format)                            events#index
#                                       POST     /events(.:format)                            events#create
#                             new_event GET      /events/new(.:format)                        events#new
#                            edit_event GET      /events/:id/edit(.:format)                   events#edit
#                                 event GET      /events/:id(.:format)                        events#show
#                                       PATCH    /events/:id(.:format)                        events#update
#                                       PUT      /events/:id(.:format)                        events#update
#                                       DELETE   /events/:id(.:format)                        events#destroy
#                                  root GET      /                                            visitors#index
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
#                         user_mentions GET      /user/mentions(.:format)                     user#mentions
#                            user_index GET      /user(.:format)                              user#index
#                                       POST     /user(.:format)                              user#create
#                              new_user GET      /user/new(.:format)                          user#new
#                             edit_user GET      /user/:id/edit(.:format)                     user#edit
#                                  user GET      /user/:id(.:format)                          user#show
#                                       PATCH    /user/:id(.:format)                          user#update
#                                       PUT      /user/:id(.:format)                          user#update
#                                       DELETE   /user/:id(.:format)                          user#destroy
#                         venues_search GET      /venues/search(.:format)                     venues#search
#                                venues GET      /venues(.:format)                            venues#index
#                                       POST     /venues(.:format)                            venues#create
#                             new_venue GET      /venues/new(.:format)                        venues#new
#                            edit_venue GET      /venues/:id/edit(.:format)                   venues#edit
#                                 venue GET      /venues/:id(.:format)                        venues#show
#                                       PATCH    /venues/:id(.:format)                        venues#update
#                                       PUT      /venues/:id(.:format)                        venues#update
#                                       DELETE   /venues/:id(.:format)                        venues#destroy
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
#                                  page GET      /pages/*id                                   high_voltage/pages#show
# 

Rails.application.routes.draw do
  ### Comments ###
  get 'comments/show', controller: :comments
  resources :comments, except: :show

  ### Conversations / Messages ###
  # resources :conversations do
  #   resources :messages
  #
  #   collection do
  #     get :inbox
  #     get :all, action: :index
  #     get :sent
  #     get :trash
  #   end
  # end

  # mailbox folder routes
  get 'mailbox/inbox', controller: :mailbox
  get 'mailbox/sent', controller: :mailbox
  get 'mailbox/trash', controller: :mailbox
  get 'mailbox/' => 'mailbox#index', as: :mailbox_index

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  ### Events ###
  get 'events/calendar', controller: :events
  resources :events

  ### Root: Visitors ###
  root to: 'visitors#index'

  ### Users ###
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  get 'user/mentions', controller: :user
  resources :user

  ### Venues ###
  get 'venues/search', controller: :venues
  resources :venues

  ### Votes ###
  post '/votes/like', to: 'votes#create'
  delete '/votes/unlike', to: 'votes#destroy'
  resources :votes
end
