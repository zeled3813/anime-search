require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/kitsu.rb'

class ApplicationController < Sinatra::Base

  get '/' do #Obtains user input from the user.
    erb :index #Displays the index page to the user.
  end
  
  post '/result' do #Performs the methods and shows the user the result.
    anime_name = params[:anime_name]  #Obtains what user typed in the text box.
    @anime_name_result = anime_name_search(anime_name) #Provides user input to anime name method.
    @anime_desc_result = anime_description_search(anime_name) #Provides user input to anime summary method.
    @anime_episode_count_result = anime_episode_count_search(anime_name) #Provides user input to anime episode count method.
    @anime_episode_length_result = anime_episode_length_search(anime_name) #Provides user input to anime episode length method.
    @anime_date_release_result = anime_date_release_search(anime_name) #Provides user input to anime date released method.
    @anime_status_result = anime_status_search(anime_name) #Provides user input to anime status method.
    @anime_image_url = anime_image_search(anime_name) #Provides user input to anime image url method.
    @anime_video_code = anime_video_search(anime_name) #Provides user input to anime video code method.
    erb :result #Displays the result page to the user.
  end
end
