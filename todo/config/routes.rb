Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items do
      patch :complete, on: :member
    end
  end

  root "todo_lists#index"
end
