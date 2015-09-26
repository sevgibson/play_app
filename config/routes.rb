Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :expenses
  resources :expense_types
end
