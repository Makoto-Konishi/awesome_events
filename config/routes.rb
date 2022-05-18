Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :events do
    resources :tickets
  end

  resource :retirements

  match "*path" => 'application#error404', via: :all # 設定していないリクエストがきた場合に、error404アクションに飛ぶ
end
