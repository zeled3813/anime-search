require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/kitsu.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do 
    anime_name = params[:anime_name]
    @anime_name_result = anime_name_search(anime_name)
    @anime_desc_result = anime_description_search(anime_name)
    @anime_episode_count_result = anime_episode_count_search(anime_name)
    @anime_episode_length_result = anime_episode_length_search(anime_name)
    @anime_date_release_result = anime_date_release_search(anime_name)
    @anime_status_result = anime_status_search(anime_name)
    @anime_image_url = anime_image_search(anime_name)
    erb :result
  end
end
