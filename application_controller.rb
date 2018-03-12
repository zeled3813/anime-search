require 'dotenv/load'
require 'bundler'
require 'kitsu'
Bundler.require

require_relative 'models/kitsu.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  
  post '/result' do 
    @anime_name = params[:name]
    # # @anime_description = params[:description]
    # # @anime_date = params[:date]
    erb :result
  end
  
end
