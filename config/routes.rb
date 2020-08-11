# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  
  get 'tree', to: 'julopedia_nodes#tree'
  
  # get 'julopedia_nodes/index'
  resources :julopedia_nodes
end
