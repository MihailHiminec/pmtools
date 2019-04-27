class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlanck
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    root 'dashboard#index', as: :subdomain_root
    devise_for :users
    resources :users, only: [ :index, :show, :edit ]
    resources :contractors, only: [:index, :new, :create, :destroy, :show, :edit, :update]
    resources :contacts, only: [:index, :new, :create, :destroy, :show, :edit, :update]
    resources :projects, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
      resources :todos
      resources :payments
    end
  end

  constraints(SubdomainBlanck) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end
end