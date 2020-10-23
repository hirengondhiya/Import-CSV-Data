Rails.application.routes.draw do
  root to: "people#index"
  post 'people/import', to: 'people#import', as: 'import_people'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
