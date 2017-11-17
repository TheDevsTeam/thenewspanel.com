Rails.application.routes.draw do

  devise_for :authors
  resources :articles
  root to: 'newsroom/posts#index'

  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info'    => 'accounts#update_info', as: :info
    put '/change_password'    => 'accounts#change_password', as: :change_password
    resources :posts do
      put 'publish'   => 'posts#publish',    on: :member
      put 'unpublish' => 'posts#unpublish',  on: :member
    end
  end

  scope module: 'newsroom' do
    get 'about'     =>   '_pages#about',   as: :about
    get 'contact'   =>   '_pages#contact', as: :contact
    get 'posts'     =>   'posts#index',    as: :posts
    get 'posts/:id' =>   'posts#show',     as: :post
    get 'travel'   =>   '_pages#travel', as: :travel
    get 'politics_in_africa'   =>   '_pages#politics_in_africa', as: :politics_in_africa
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
