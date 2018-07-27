# == Route Map
#
#                                Prefix Verb     URI Pattern                                                                              Controller#Action
#                               trestle          /admin                                                                                   Trestle::Engine
#                          reservations GET      /reservations(.:format)                                                                  reservations#index
#                                       POST     /reservations(.:format)                                                                  reservations#create
#                       new_reservation GET      /reservations/new(.:format)                                                              reservations#new
#                      edit_reservation GET      /reservations/:id/edit(.:format)                                                         reservations#edit
#                           reservation GET      /reservations/:id(.:format)                                                              reservations#show
#                                       PATCH    /reservations/:id(.:format)                                                              reservations#update
#                                       PUT      /reservations/:id(.:format)                                                              reservations#update
#                                       DELETE   /reservations/:id(.:format)                                                              reservations#destroy
#                         comments_show GET      /comments/show(.:format)                                                                 comments#show
#                              comments GET      /comments(.:format)                                                                      comments#index
#                                       POST     /comments(.:format)                                                                      comments#create
#                           new_comment GET      /comments/new(.:format)                                                                  comments#new
#                          edit_comment GET      /comments/:id/edit(.:format)                                                             comments#edit
#                               comment PATCH    /comments/:id(.:format)                                                                  comments#update
#                                       PUT      /comments/:id(.:format)                                                                  comments#update
#                                       DELETE   /comments/:id(.:format)                                                                  comments#destroy
#                         mailbox_inbox GET      /mailbox/inbox(.:format)                                                                 mailbox#inbox
#                          mailbox_sent GET      /mailbox/sent(.:format)                                                                  mailbox#sent
#                         mailbox_trash GET      /mailbox/trash(.:format)                                                                 mailbox#trash
#                         mailbox_index GET      /mailbox(.:format)                                                                       mailbox#index
#                    reply_conversation POST     /conversations/:id/reply(.:format)                                                       conversations#reply
#                    trash_conversation POST     /conversations/:id/trash(.:format)                                                       conversations#trash
#                  untrash_conversation POST     /conversations/:id/untrash(.:format)                                                     conversations#untrash
#                         conversations GET      /conversations(.:format)                                                                 conversations#index
#                                       POST     /conversations(.:format)                                                                 conversations#create
#                      new_conversation GET      /conversations/new(.:format)                                                             conversations#new
#                     edit_conversation GET      /conversations/:id/edit(.:format)                                                        conversations#edit
#                          conversation GET      /conversations/:id(.:format)                                                             conversations#show
#                                       PATCH    /conversations/:id(.:format)                                                             conversations#update
#                                       PUT      /conversations/:id(.:format)                                                             conversations#update
#                                       DELETE   /conversations/:id(.:format)                                                             conversations#destroy
#                       events_calendar GET      /events/calendar(.:format)                                                               events#calendar
#                           events_mine GET      /events/mine(.:format)                                                                   events#mine
#                           events_rsvp GET      /events/rsvp(.:format)                                                                   events#rsvp
#                                events GET      /events(.:format)                                                                        events#index
#                                       POST     /events(.:format)                                                                        events#create
#                             new_event GET      /events/new(.:format)                                                                    events#new
#                            edit_event GET      /events/:id/edit(.:format)                                                               events#edit
#                                 event GET      /events/:id(.:format)                                                                    events#show
#                                       PATCH    /events/:id(.:format)                                                                    events#update
#                                       PUT      /events/:id(.:format)                                                                    events#update
#                                       DELETE   /events/:id(.:format)                                                                    events#destroy
#                              services GET      /services(.:format)                                                                      services#index
#                                       POST     /services(.:format)                                                                      services#create
#                           new_service GET      /services/new(.:format)                                                                  services#new
#                          edit_service GET      /services/:id/edit(.:format)                                                             services#edit
#                               service GET      /services/:id(.:format)                                                                  services#show
#                                       PATCH    /services/:id(.:format)                                                                  services#update
#                                       PUT      /services/:id(.:format)                                                                  services#update
#                                       DELETE   /services/:id(.:format)                                                                  services#destroy
#                      new_user_session GET      /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST     /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE   /users/sign_out(.:format)                                                                devise/sessions#destroy
#      user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)                                                           omniauth_callbacks#passthru
#       user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)                                                  omniauth_callbacks#facebook
# user_google_oauth2_omniauth_authorize GET|POST /users/auth/google_oauth2(.:format)                                                      omniauth_callbacks#passthru
#  user_google_oauth2_omniauth_callback GET|POST /users/auth/google_oauth2/callback(.:format)                                             omniauth_callbacks#google_oauth2
#       user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)                                                            omniauth_callbacks#passthru
#        user_twitter_omniauth_callback GET|POST /users/auth/twitter/callback(.:format)                                                   omniauth_callbacks#twitter
#                     new_user_password GET      /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET      /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH    /users/password(.:format)                                                                devise/passwords#update
#                                       PUT      /users/password(.:format)                                                                devise/passwords#update
#                                       POST     /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET      /users/cancel(.:format)                                                                  registrations#cancel
#                 new_user_registration GET      /users/sign_up(.:format)                                                                 registrations#new
#                edit_user_registration GET      /users/edit(.:format)                                                                    registrations#edit
#                     user_registration PATCH    /users(.:format)                                                                         registrations#update
#                                       PUT      /users(.:format)                                                                         registrations#update
#                                       DELETE   /users(.:format)                                                                         registrations#destroy
#                                       POST     /users(.:format)                                                                         registrations#create
#                 new_user_confirmation GET      /users/confirmation/new(.:format)                                                        devise/confirmations#new
#                     user_confirmation GET      /users/confirmation(.:format)                                                            devise/confirmations#show
#                                       POST     /users/confirmation(.:format)                                                            devise/confirmations#create
#                                  root GET      /                                                                                        visitors#index
#                  unauthenticated_root GET      /                                                                                        devise/registrations#new
#                         user_mentions GET      /user/mentions(.:format)                                                                 user#mentions
#                            user_index GET      /user(.:format)                                                                          user#index
#                                       POST     /user(.:format)                                                                          user#create
#                              new_user GET      /user/new(.:format)                                                                      user#new
#                             edit_user GET      /user/:id/edit(.:format)                                                                 user#edit
#                                  user GET      /user/:id(.:format)                                                                      user#show
#                                       PATCH    /user/:id(.:format)                                                                      user#update
#                                       PUT      /user/:id(.:format)                                                                      user#update
#                                       DELETE   /user/:id(.:format)                                                                      user#destroy
#                         venues_search GET      /venues/search(.:format)                                                                 venues#search
#                                venues GET      /venues(.:format)                                                                        venues#index
#                                       POST     /venues(.:format)                                                                        venues#create
#                             new_venue GET      /venues/new(.:format)                                                                    venues#new
#                            edit_venue GET      /venues/:id/edit(.:format)                                                               venues#edit
#                                 venue GET      /venues/:id(.:format)                                                                    venues#show
#                                       PATCH    /venues/:id(.:format)                                                                    venues#update
#                                       PUT      /venues/:id(.:format)                                                                    venues#update
#                                       DELETE   /venues/:id(.:format)                                                                    venues#destroy
#                            votes_like POST     /votes/like(.:format)                                                                    votes#create
#                          votes_unlike DELETE   /votes/unlike(.:format)                                                                  votes#destroy
#                                 votes GET      /votes(.:format)                                                                         votes#index
#                                       POST     /votes(.:format)                                                                         votes#create
#                              new_vote GET      /votes/new(.:format)                                                                     votes#new
#                             edit_vote GET      /votes/:id/edit(.:format)                                                                votes#edit
#                                  vote GET      /votes/:id(.:format)                                                                     votes#show
#                                       PATCH    /votes/:id(.:format)                                                                     votes#update
#                                       PUT      /votes/:id(.:format)                                                                     votes#update
#                                       DELETE   /votes/:id(.:format)                                                                     votes#destroy
#                      charts_new_users GET      /charts/new_users(.:format)                                                              charts#new_users
#                         charts_events GET      /charts/events(.:format)                                                                 charts#events
#                     simple_discussion          /community                                                                               SimpleDiscussion::Engine
#                     letter_opener_web          /letter_opener                                                                           LetterOpenerWeb::Engine
#                                  page GET      /pages/*id                                                                               high_voltage/pages#show
#                    rails_service_blob GET      /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET      /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET      /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT      /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST     /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# 
# Routes for Trestle::Engine:
#                     sidekiq_web        /sidekiq/web                            Sidekiq::Web
#                                 GET    /sidekiq/web(.:format)                  redirect(302, login)
#                           login GET    /login(.:format)                        trestle/auth/sessions#new
#                                 POST   /login(.:format)                        trestle/auth/sessions#create
#                          logout GET    /logout(.:format)                       trestle/auth/sessions#destroy
# auth_administrators_admin_index GET    /auth/administrators(.:format)          auth/administrators_admin/admin#index
#                                 POST   /auth/administrators(.:format)          auth/administrators_admin/admin#create
#   new_auth_administrators_admin GET    /auth/administrators/new(.:format)      auth/administrators_admin/admin#new
#  edit_auth_administrators_admin GET    /auth/administrators/:id/edit(.:format) auth/administrators_admin/admin#edit
#       auth_administrators_admin GET    /auth/administrators/:id(.:format)      auth/administrators_admin/admin#show
#                                 PATCH  /auth/administrators/:id(.:format)      auth/administrators_admin/admin#update
#                                 PUT    /auth/administrators/:id(.:format)      auth/administrators_admin/admin#update
#                                 DELETE /auth/administrators/:id(.:format)      auth/administrators_admin/admin#destroy
#          categories_admin_index GET    /categories(.:format)                   categories_admin/admin#index
#                                 POST   /categories(.:format)                   categories_admin/admin#create
#            new_categories_admin GET    /categories/new(.:format)               categories_admin/admin#new
#           edit_categories_admin GET    /categories/:id/edit(.:format)          categories_admin/admin#edit
#                categories_admin GET    /categories/:id(.:format)               categories_admin/admin#show
#                                 PATCH  /categories/:id(.:format)               categories_admin/admin#update
#                                 PUT    /categories/:id(.:format)               categories_admin/admin#update
#                                 DELETE /categories/:id(.:format)               categories_admin/admin#destroy
#            comments_admin_index GET    /comments(.:format)                     comments_admin/admin#index
#                                 POST   /comments(.:format)                     comments_admin/admin#create
#              new_comments_admin GET    /comments/new(.:format)                 comments_admin/admin#new
#             edit_comments_admin GET    /comments/:id/edit(.:format)            comments_admin/admin#edit
#                  comments_admin GET    /comments/:id(.:format)                 comments_admin/admin#show
#                                 PATCH  /comments/:id(.:format)                 comments_admin/admin#update
#                                 PUT    /comments/:id(.:format)                 comments_admin/admin#update
#                                 DELETE /comments/:id(.:format)                 comments_admin/admin#destroy
#                 dashboard_admin GET    /dashboard(.:format)                    dashboard_admin/admin#index
#    event_categories_admin_index GET    /event_categories(.:format)             event_categories_admin/admin#index
#                                 POST   /event_categories(.:format)             event_categories_admin/admin#create
#      new_event_categories_admin GET    /event_categories/new(.:format)         event_categories_admin/admin#new
#     edit_event_categories_admin GET    /event_categories/:id/edit(.:format)    event_categories_admin/admin#edit
#          event_categories_admin GET    /event_categories/:id(.:format)         event_categories_admin/admin#show
#                                 PATCH  /event_categories/:id(.:format)         event_categories_admin/admin#update
#                                 PUT    /event_categories/:id(.:format)         event_categories_admin/admin#update
#                                 DELETE /event_categories/:id(.:format)         event_categories_admin/admin#destroy
#        event_venues_admin_index GET    /event_venues(.:format)                 event_venues_admin/admin#index
#                                 POST   /event_venues(.:format)                 event_venues_admin/admin#create
#          new_event_venues_admin GET    /event_venues/new(.:format)             event_venues_admin/admin#new
#         edit_event_venues_admin GET    /event_venues/:id/edit(.:format)        event_venues_admin/admin#edit
#              event_venues_admin GET    /event_venues/:id(.:format)             event_venues_admin/admin#show
#                                 PATCH  /event_venues/:id(.:format)             event_venues_admin/admin#update
#                                 PUT    /event_venues/:id(.:format)             event_venues_admin/admin#update
#                                 DELETE /event_venues/:id(.:format)             event_venues_admin/admin#destroy
#              events_admin_index GET    /events(.:format)                       events_admin/admin#index
#                                 POST   /events(.:format)                       events_admin/admin#create
#                new_events_admin GET    /events/new(.:format)                   events_admin/admin#new
#               edit_events_admin GET    /events/:id/edit(.:format)              events_admin/admin#edit
#                    events_admin GET    /events/:id(.:format)                   events_admin/admin#show
#                                 PATCH  /events/:id(.:format)                   events_admin/admin#update
#                                 PUT    /events/:id(.:format)                   events_admin/admin#update
#                                 DELETE /events/:id(.:format)                   events_admin/admin#destroy
#    forum_categories_admin_index GET    /forum_categories(.:format)             forum_categories_admin/admin#index
#                                 POST   /forum_categories(.:format)             forum_categories_admin/admin#create
#      new_forum_categories_admin GET    /forum_categories/new(.:format)         forum_categories_admin/admin#new
#     edit_forum_categories_admin GET    /forum_categories/:id/edit(.:format)    forum_categories_admin/admin#edit
#          forum_categories_admin GET    /forum_categories/:id(.:format)         forum_categories_admin/admin#show
#                                 PATCH  /forum_categories/:id(.:format)         forum_categories_admin/admin#update
#                                 PUT    /forum_categories/:id(.:format)         forum_categories_admin/admin#update
#                                 DELETE /forum_categories/:id(.:format)         forum_categories_admin/admin#destroy
#         forum_posts_admin_index GET    /forum_posts(.:format)                  forum_posts_admin/admin#index
#                                 POST   /forum_posts(.:format)                  forum_posts_admin/admin#create
#           new_forum_posts_admin GET    /forum_posts/new(.:format)              forum_posts_admin/admin#new
#          edit_forum_posts_admin GET    /forum_posts/:id/edit(.:format)         forum_posts_admin/admin#edit
#               forum_posts_admin GET    /forum_posts/:id(.:format)              forum_posts_admin/admin#show
#                                 PATCH  /forum_posts/:id(.:format)              forum_posts_admin/admin#update
#                                 PUT    /forum_posts/:id(.:format)              forum_posts_admin/admin#update
#                                 DELETE /forum_posts/:id(.:format)              forum_posts_admin/admin#destroy
# forum_subscriptions_admin_index GET    /forum_subscriptions(.:format)          forum_subscriptions_admin/admin#index
#                                 POST   /forum_subscriptions(.:format)          forum_subscriptions_admin/admin#create
#   new_forum_subscriptions_admin GET    /forum_subscriptions/new(.:format)      forum_subscriptions_admin/admin#new
#  edit_forum_subscriptions_admin GET    /forum_subscriptions/:id/edit(.:format) forum_subscriptions_admin/admin#edit
#       forum_subscriptions_admin GET    /forum_subscriptions/:id(.:format)      forum_subscriptions_admin/admin#show
#                                 PATCH  /forum_subscriptions/:id(.:format)      forum_subscriptions_admin/admin#update
#                                 PUT    /forum_subscriptions/:id(.:format)      forum_subscriptions_admin/admin#update
#                                 DELETE /forum_subscriptions/:id(.:format)      forum_subscriptions_admin/admin#destroy
#       forum_threads_admin_index GET    /forum_threads(.:format)                forum_threads_admin/admin#index
#                                 POST   /forum_threads(.:format)                forum_threads_admin/admin#create
#         new_forum_threads_admin GET    /forum_threads/new(.:format)            forum_threads_admin/admin#new
#        edit_forum_threads_admin GET    /forum_threads/:id/edit(.:format)       forum_threads_admin/admin#edit
#             forum_threads_admin GET    /forum_threads/:id(.:format)            forum_threads_admin/admin#show
#                                 PATCH  /forum_threads/:id(.:format)            forum_threads_admin/admin#update
#                                 PUT    /forum_threads/:id(.:format)            forum_threads_admin/admin#update
#                                 DELETE /forum_threads/:id(.:format)            forum_threads_admin/admin#destroy
#          identities_admin_index GET    /identities(.:format)                   identities_admin/admin#index
#                                 POST   /identities(.:format)                   identities_admin/admin#create
#            new_identities_admin GET    /identities/new(.:format)               identities_admin/admin#new
#           edit_identities_admin GET    /identities/:id/edit(.:format)          identities_admin/admin#edit
#                identities_admin GET    /identities/:id(.:format)               identities_admin/admin#show
#                                 PATCH  /identities/:id(.:format)               identities_admin/admin#update
#                                 PUT    /identities/:id(.:format)               identities_admin/admin#update
#                                 DELETE /identities/:id(.:format)               identities_admin/admin#destroy
#           interests_admin_index GET    /interests(.:format)                    interests_admin/admin#index
#                                 POST   /interests(.:format)                    interests_admin/admin#create
#             new_interests_admin GET    /interests/new(.:format)                interests_admin/admin#new
#            edit_interests_admin GET    /interests/:id/edit(.:format)           interests_admin/admin#edit
#                 interests_admin GET    /interests/:id(.:format)                interests_admin/admin#show
#                                 PATCH  /interests/:id(.:format)                interests_admin/admin#update
#                                 PUT    /interests/:id(.:format)                interests_admin/admin#update
#                                 DELETE /interests/:id(.:format)                interests_admin/admin#destroy
#                kids_admin_index GET    /kids(.:format)                         kids_admin/admin#index
#                                 POST   /kids(.:format)                         kids_admin/admin#create
#                  new_kids_admin GET    /kids/new(.:format)                     kids_admin/admin#new
#                 edit_kids_admin GET    /kids/:id/edit(.:format)                kids_admin/admin#edit
#                      kids_admin GET    /kids/:id(.:format)                     kids_admin/admin#show
#                                 PATCH  /kids/:id(.:format)                     kids_admin/admin#update
#                                 PUT    /kids/:id(.:format)                     kids_admin/admin#update
#                                 DELETE /kids/:id(.:format)                     kids_admin/admin#destroy
#            services_admin_index GET    /services(.:format)                     services_admin/admin#index
#                                 POST   /services(.:format)                     services_admin/admin#create
#              new_services_admin GET    /services/new(.:format)                 services_admin/admin#new
#             edit_services_admin GET    /services/:id/edit(.:format)            services_admin/admin#edit
#                  services_admin GET    /services/:id(.:format)                 services_admin/admin#show
#                                 PATCH  /services/:id(.:format)                 services_admin/admin#update
#                                 PUT    /services/:id(.:format)                 services_admin/admin#update
#                                 DELETE /services/:id(.:format)                 services_admin/admin#destroy
#      sub_categories_admin_index GET    /sub_categories(.:format)               sub_categories_admin/admin#index
#                                 POST   /sub_categories(.:format)               sub_categories_admin/admin#create
#        new_sub_categories_admin GET    /sub_categories/new(.:format)           sub_categories_admin/admin#new
#       edit_sub_categories_admin GET    /sub_categories/:id/edit(.:format)      sub_categories_admin/admin#edit
#            sub_categories_admin GET    /sub_categories/:id(.:format)           sub_categories_admin/admin#show
#                                 PATCH  /sub_categories/:id(.:format)           sub_categories_admin/admin#update
#                                 PUT    /sub_categories/:id(.:format)           sub_categories_admin/admin#update
#                                 DELETE /sub_categories/:id(.:format)           sub_categories_admin/admin#destroy
#      user_interests_admin_index GET    /user_interests(.:format)               user_interests_admin/admin#index
#                                 POST   /user_interests(.:format)               user_interests_admin/admin#create
#        new_user_interests_admin GET    /user_interests/new(.:format)           user_interests_admin/admin#new
#       edit_user_interests_admin GET    /user_interests/:id/edit(.:format)      user_interests_admin/admin#edit
#            user_interests_admin GET    /user_interests/:id(.:format)           user_interests_admin/admin#show
#                                 PATCH  /user_interests/:id(.:format)           user_interests_admin/admin#update
#                                 PUT    /user_interests/:id(.:format)           user_interests_admin/admin#update
#                                 DELETE /user_interests/:id(.:format)           user_interests_admin/admin#destroy
#               users_admin_index GET    /users(.:format)                        users_admin/admin#index
#                                 POST   /users(.:format)                        users_admin/admin#create
#                 new_users_admin GET    /users/new(.:format)                    users_admin/admin#new
#                edit_users_admin GET    /users/:id/edit(.:format)               users_admin/admin#edit
#                     users_admin GET    /users/:id(.:format)                    users_admin/admin#show
#                                 PATCH  /users/:id(.:format)                    users_admin/admin#update
#                                 PUT    /users/:id(.:format)                    users_admin/admin#update
#                                 DELETE /users/:id(.:format)                    users_admin/admin#destroy
#              venues_admin_index GET    /venues(.:format)                       venues_admin/admin#index
#                                 POST   /venues(.:format)                       venues_admin/admin#create
#                new_venues_admin GET    /venues/new(.:format)                   venues_admin/admin#new
#               edit_venues_admin GET    /venues/:id/edit(.:format)              venues_admin/admin#edit
#                    venues_admin GET    /venues/:id(.:format)                   venues_admin/admin#show
#                                 PATCH  /venues/:id(.:format)                   venues_admin/admin#update
#                                 PUT    /venues/:id(.:format)                   venues_admin/admin#update
#                                 DELETE /venues/:id(.:format)                   venues_admin/admin#destroy
#               votes_admin_index GET    /votes(.:format)                        votes_admin/admin#index
#                                 POST   /votes(.:format)                        votes_admin/admin#create
#                 new_votes_admin GET    /votes/new(.:format)                    votes_admin/admin#new
#                edit_votes_admin GET    /votes/:id/edit(.:format)               votes_admin/admin#edit
#                     votes_admin GET    /votes/:id(.:format)                    votes_admin/admin#show
#                                 PATCH  /votes/:id(.:format)                    votes_admin/admin#update
#                                 PUT    /votes/:id(.:format)                    votes_admin/admin#update
#                                 DELETE /votes/:id(.:format)                    votes_admin/admin#destroy
#   trestle_sidekiq_sidekiq_admin GET    /sidekiq(.:format)                      trestle/sidekiq/sidekiq_admin/admin#index
#                            root GET    /                                       trestle/dashboard#index
# 
# Routes for SimpleDiscussion::Engine:
#           answered_forum_threads GET    /threads/answered(.:format)                            simple_discussion/forum_threads#answered
#         unanswered_forum_threads GET    /threads/unanswered(.:format)                          simple_discussion/forum_threads#unanswered
#               mine_forum_threads GET    /threads/mine(.:format)                                simple_discussion/forum_threads#mine
#      participating_forum_threads GET    /threads/participating(.:format)                       simple_discussion/forum_threads#participating
#     forum_category_forum_threads GET    /threads/category/:id(.:format)                        simple_discussion/forum_categories#index
#   solved_forum_thread_forum_post PUT    /threads/:forum_thread_id/posts/:id/solved(.:format)   simple_discussion/forum_posts#solved
# unsolved_forum_thread_forum_post PUT    /threads/:forum_thread_id/posts/:id/unsolved(.:format) simple_discussion/forum_posts#unsolved
#         forum_thread_forum_posts GET    /threads/:forum_thread_id/posts(.:format)              simple_discussion/forum_posts#index
#                                  POST   /threads/:forum_thread_id/posts(.:format)              simple_discussion/forum_posts#create
#      new_forum_thread_forum_post GET    /threads/:forum_thread_id/posts/new(.:format)          simple_discussion/forum_posts#new
#     edit_forum_thread_forum_post GET    /threads/:forum_thread_id/posts/:id/edit(.:format)     simple_discussion/forum_posts#edit
#          forum_thread_forum_post GET    /threads/:forum_thread_id/posts/:id(.:format)          simple_discussion/forum_posts#show
#                                  PATCH  /threads/:forum_thread_id/posts/:id(.:format)          simple_discussion/forum_posts#update
#                                  PUT    /threads/:forum_thread_id/posts/:id(.:format)          simple_discussion/forum_posts#update
#                                  DELETE /threads/:forum_thread_id/posts/:id(.:format)          simple_discussion/forum_posts#destroy
#   new_forum_thread_notifications GET    /threads/:forum_thread_id/notifications/new(.:format)  simple_discussion/notifications#new
#  edit_forum_thread_notifications GET    /threads/:forum_thread_id/notifications/edit(.:format) simple_discussion/notifications#edit
#       forum_thread_notifications GET    /threads/:forum_thread_id/notifications(.:format)      simple_discussion/notifications#show
#                                  PATCH  /threads/:forum_thread_id/notifications(.:format)      simple_discussion/notifications#update
#                                  PUT    /threads/:forum_thread_id/notifications(.:format)      simple_discussion/notifications#update
#                                  DELETE /threads/:forum_thread_id/notifications(.:format)      simple_discussion/notifications#destroy
#                                  POST   /threads/:forum_thread_id/notifications(.:format)      simple_discussion/notifications#create
#                    forum_threads GET    /threads(.:format)                                     simple_discussion/forum_threads#index
#                                  POST   /threads(.:format)                                     simple_discussion/forum_threads#create
#                 new_forum_thread GET    /threads/new(.:format)                                 simple_discussion/forum_threads#new
#                edit_forum_thread GET    /threads/:id/edit(.:format)                            simple_discussion/forum_threads#edit
#                     forum_thread GET    /threads/:id(.:format)                                 simple_discussion/forum_threads#show
#                                  PATCH  /threads/:id(.:format)                                 simple_discussion/forum_threads#update
#                                  PUT    /threads/:id(.:format)                                 simple_discussion/forum_threads#update
#                                  DELETE /threads/:id(.:format)                                 simple_discussion/forum_threads#destroy
#                             root GET    /                                                      simple_discussion/forum_threads#index
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  resources :reservations
  ### Comments ###
  get 'comments/show', controller: :comments
  resources :comments, except: :show

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
  get 'events/mine', to: 'events#mine'
  get 'events/rsvp', to: 'events#rsvp'
  resources :events

  ### Root: Visitors ###
  #root to: 'visitors#index'

  ### Services ###
  resources :services

  ### Users ###
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  devise_scope :user do
    authenticated :user do
      root to: 'visitors#index'
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  get 'user/mentions', controller: :user
  resources :user

  ### Venues ###
  get 'venues/search', controller: :venues
  resources :venues

  ### Votes ###
  post '/votes/like', to: 'votes#create'
  delete '/votes/unlike', to: 'votes#destroy'
  resources :votes

  ### Chartkick for Trestle Admin ###
  namespace :charts do
    get 'new_users'
    get 'events'
  end

  ### Community ###
  mount SimpleDiscussion::Engine => '/community'

  ### Emails in Development ###
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
