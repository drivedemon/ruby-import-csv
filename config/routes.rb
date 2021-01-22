require 'sidekiq/web'

Rails.application.routes.draw do
  get '/', to: 'users#import'
  get '/users', to: 'users#index', as: 'users'
end
