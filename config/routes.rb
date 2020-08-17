# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  
  get 'tree', to: 'julopedia_nodes#tree'
  get 'tree2', to: 'julopedia_nodes#tree2'
  
  # get 'julopedia_nodes/index'
  resources :julopedia_nodes
end
