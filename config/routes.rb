Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  devise_for :user

  resources :counterparties
  resources :groups_counterparties
  resources :goods

  # resources :users do
  #   member do
  #     put 'block', to: 'blockingusers#block'
  #     put 'unblock', to: 'blockingusers#unblock'
  #   end
  #
  #   collection do
  #     get 'search', to: 'search#show'
  #   end
  # end

  namespace :admin do
    resources :users do
      member do
        put 'block', to: 'blockingusers#block'
        put 'unblock', to: 'blockingusers#unblock'
      end
    end
  end

  namespace :profile do
    resources :user, except: [:new, :create]
  end

  root to: "home#index"
end

__END__
# ресурс -> URL -> тип (.mp3 .js .css .html .xml .mp4 .ttf)
  # hypertext transfer protocol
  # http://    mail.ru:  8080   /media/video_234                       .mp4
  # ПРОТОКОЛ - ХОСТ -    ПОРТ - ОТНОСИТЕЛЬНЫЙ АДРЕС РЕСУРСА на хосте - ТИП ресурса
  # sftp://

#  data                         data
#   |                            |
#  ftp          spy             ftp
#   |____________|_______________|
#   |                            |
#  ssh                          ssh
#   |____________________________|
#   |                            |
#  tcp/ip                      tcp/ip
#   |____________________________|


  #HTTP specification
  # GET PUT POST DELETE OPTION

  # список ресурсов данного вида            -> index GET
  # конкретный ресурс                       -> show  GET
  # создать ресурс  POST           (create) -> new   GET
  # изменить ресурс PUT            (update) -> edit  GET
  # удалить ресурс  DELETE         (destroy)
