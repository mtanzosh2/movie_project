require 'net/http'
require 'json'

def format_url(genre_id)
    url = "https://api.themoviedb.org/3/discover/movie?with_genres=#{genre_id}&sort_by=popularity.desc?&api_key=8cd641fe58ace9a3561002f6a4a0a852"
    return url
end

def call_moviedb(url)
    # include all the gems needed to use apis in ruby
    # open an access point to grab data
    uri = URI(url)
    data = Net::HTTP.get(uri)
    # convert the data to a ruby hash
    formatted_data = JSON.parse(data)
    # puts formatted_data
    titles = []
    
    formatted_data["results"].map do |movie|
        titles.push( movie["title"])
    end
    return titles
end


# url = format_url(878)
# puts call_moviedb(url)