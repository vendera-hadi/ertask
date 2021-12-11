Rails.application.routes.draw do
  constraints format: :json do
    resources :scores, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
