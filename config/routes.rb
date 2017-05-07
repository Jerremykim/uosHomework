Rails.application.routes.draw do
  root 'poster#index'
  get 'new_movie' => 'poster#new_movie'
  get 'delete' => 'poster#delete'
  get 'edit' => 'poster#edit'
end


