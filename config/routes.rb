Rails.application.routes.draw do
  root 'sessions#new'

  resources :accounts do
    resources :cards, only: [:index] do
      put :freeze
      put :unfreeze
    end

    resources :transactions, only: [:index, :show] do
      collection do
        get :map        
      end
    end
  end

  resources :sessions, only: [:new] do
    collection do
      get :callback
    end
  end
end
