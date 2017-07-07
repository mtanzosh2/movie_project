require './config/environment'
require './app/models/movie_magic.rb'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/results' do
    genre_id = params[:genre_selection]
    search_term = params[:search_term]
    url = format_url(genre_id, search_term)
    @movie_list = call_moviedb(url)
    # return @movie_list
    erb :results
  end
end
