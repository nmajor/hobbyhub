Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :hobbies, except: [:show] do
    get 'random', on: :collection
  end
  post '/greeting/dismiss', to: 'greetings#dismiss', as: 'dismiss_greeting'
  get '/:slug', to: 'hobbies#show', as: 'hobby_slug'
end
