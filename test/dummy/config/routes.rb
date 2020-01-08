Rails.application.routes.draw do
  mount Model::Engine => "/model"
end
