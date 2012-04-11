Bowling::Application.routes.draw do
  root :to => 'games#index'
  resources :games do
    get :about, :on => :collection
  end
end
