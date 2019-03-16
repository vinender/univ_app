Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'courses#index'
get 'courses/new', to: 'courses#new'
get 'about', to: 'pages#about'
# resources will create all routes for student
resources :students, except: [:destroy]
end
