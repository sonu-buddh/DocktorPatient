Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  
  get 'home/index'
  get 'home/salary'
  get 'home/show_salary'
  post 'home/calculate_salary'
  
  get "approve_appoinment/:id", to: "appoinments#approve_appoinment", as: 'approved'
  get "reject_appoinment/:id", to: "appoinments#reject_appoinment", as: 'rejected'
  
  get "availabilities/available_doctors"
  
  resources :appoinments
  resources :availabilities
  
end
