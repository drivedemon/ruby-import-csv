require 'sidekiq/web'

Rails.application.routes.draw do
  get '/', to: 'users#import'
  get '/users', to: 'users#index', as: 'users'
  post 'import_csv', to: 'users#import_csv', as: 'import_csv'
end
