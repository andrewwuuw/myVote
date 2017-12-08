Rails.application.routes.draw do
  resources :candidates do
    # => 新增 vote 路徑
    member do
      post :vote
    end
  end
end
