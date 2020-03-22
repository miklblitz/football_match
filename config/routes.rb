Rails.application.routes.draw do
  root to: 'api#about'
  resources :matches
  resources :teams
  resources :gamers do
    member do
      get '/done_feature/:feature_id/in_match/:match_id', to: 'gamers#done_feature' # игрок выполнил такой-то показатель в матче
      get :feature_for_last_five # выполнил ли игрок конкретный показатель хотя бы 1 раз за предыдущие 5 матчей команды
    end
  end
  resources :features do
    member do
      get '/top_btw_gamers/:team_id', to: 'features#top_btw_gamers' # Top-5 игроков по конкретному показателю в конкретной команде
      get '/top_btw_teams', to: 'features#top_btw_teams' # Top-5 игроков по конкретному показателю по всем командам в целом
    end
  end
end
