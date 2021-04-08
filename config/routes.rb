Rails.application.routes.draw do
  devise_for :users
  #アクセス時にホーム画面を表示
  root to: "items#index"
end
