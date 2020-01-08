Model::Engine.routes.draw do
  # devise_for :users, class_name: "Model::User"
  mount_devise_token_auth_for 'Model::User', at: 'auth'
end
