# require 'kitsu'

# # Kitsu.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])

# # Kitsu.authenticate("dd031b32d2f56c990b1425efe6c42ad847e7fe3ab46bf1299f05ecd856bdb7dd", "54d7307928f63414defd96399fc31ba847961ceaecef3a5fd93144e960c0e151")

# return anime?filter[genres]=adventure\

require 'net/http'
require 'json'
require 'pp'
 
# url = 'https://kitsu.io/api/edge/anime?filter[genres]=romance'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# pp JSON.parse(response)
# anime_hash = JSON.parse(response)
# puts anime_hash

def anime_genre_search
    url = 'https://kitsu.io/api/edge/anime?filter[genres]=horror'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    result = " "
    
    #Searching for specific anime title below.
    anime_hash["data"].map do |key,value| 
        key.each do |key_type,value_type|
            if key_type == "attributes"
                value_type.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en_jp"
                                 puts title
                            end
                        end
                    end
                end
            end
        end
    end
    #Searching for specific anime title above.
    
    # pp anime_hash
    puts "The above are the titles in this genre"
    puts "The following is the value of result:"
    puts result
end

# anime_genre_search

def anime_name_search
    url = 'https://kitsu.io/api/edge/anime?page[limit]=20'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    anime_hash["data"].each do |key,value|
        key.each do |key_type,value_type|
            if key_type == "attributes"
                value_type.each do |title,language|
                    puts language
                end
            end
        end
    end
end

anime_name_search

def anime_description_search
     url = 'https://kitsu.io/api/edge/anime?page[limit]=20'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    anime_hash["data"].each do |key,value|
        key.each do |key_type,value_type|
            if key_type == "attributes"
                value_type.each do |title,language|
                    puts language
                end
            end
        end
    end
end

