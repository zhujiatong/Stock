Rails.application.routes.draw do
  get 'stockcontroller_two/history'
  get 'stockcontroller_two/report'
  get 'stockcontroller_one/new'
  get 'stockcontroller_one/create'
  get 'register/new'
  get 'register/create'
  get 'sessions/new'
  get 'sessions/create'
  post 'sessions/create'
  post 'register/create'
  post 'stockcontroller_one/create'
  root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
