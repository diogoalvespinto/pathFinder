Rails.application.routes.draw do
  devise_for :users

  root to: "pages#landing"

  get '/home', to: "pages#home"
  get '/profile', to: "pages#profile"
  get "/prompt", to: "prompts#sample"
  get "/graph-data", to: "logbooks#data"

  resources :logbooks do
    resources :playlists, only: %i[show]
    resources :books, only: %i[show]
    resources :movies, only: %i[show]
    resources :journals, only: %i[new create edit update destroy]
    collection do
      get "date/:date", action: :date, as: :date
    end
  end
end
