Rails.application.routes.draw do
  resources :students do
    get :subjects
  end
  resources :teachers do
    get :subjects
  end
  get '/report/subjects', to: 'reports#subjects'
  devise_for :users
  root "visitors#index"
end
