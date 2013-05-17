Assassin::Application.routes.draw do
  devise_for :users

  root :to => 'static#index'

  get "static/index"
end
