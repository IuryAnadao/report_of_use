Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  root to: 'home_page#index'

  draw :api
end
