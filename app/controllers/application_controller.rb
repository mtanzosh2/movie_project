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
    url = format_url(genre_id)
    @movie_list = call_moviedb(url)
    # return @movie_list
    erb :results
  end
end
