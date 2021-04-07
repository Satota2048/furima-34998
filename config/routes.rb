Rails.application.routes.draw do
  #アクセス時にホーム画面を表示
  root to: "items#index"
end
