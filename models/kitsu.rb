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

# def anime_genre_search
#     url = 'https://kitsu.io/api/edge/anime?filter[genres]=horror'
#     # url = 'https://kitsu.io/api/edge/anime?page[limit]=1/filter[text]=cowboy%20bebop'
#     uri = URI(url)
#     response = Net::HTTP.get(uri)
#     anime_hash = JSON.parse(response)
#     result = " "
    
#     #Searching for specific anime title below.
#     anime_hash["data"].map do |key,value| 
#         key.each do |key_type,value_type|
#             if key_type == "attributes"
#                 value_type.each do |category,detail|
#                     if category == "titles"
#                         detail.each do |language,title|
#                             if language == "en_jp"
#                                  puts title
#                             end
#                         end
#                     end
#                 end
#             end
#         end
#     end
#     #Searching for specific anime title above.
    
#     # pp anime_hash
#     puts "The above are the titles in this genre"
#     puts "The following is the value of result:"
#     puts result
# end

# anime_genre_search

def anime_name_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    # url = 'https://kitsu.io/api/edge/anime?filter[genres]=horror'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    name_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                name_result = "Anime name: " + title.to_s
                            end
                        end
                    end
                end
            end
        end
    end
    return name_result
end

# anime_name_search("Monster")

def anime_description_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    desc_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "synopsis"
                                        desc_result =  detail.to_s
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
    return desc_result
end

# anime_description_search("Monster")

def anime_episode_count_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    episode_count_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "episodeCount"
                                        episode_count_result = detail.to_s
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return episode_count_result
end

# anime_episode_count_search("Monster")

def anime_episode_length_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    episode_length_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "episodeLength"
                                        episode_length_result = detail.to_s + " min(s)"
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
    return episode_length_result
end

# anime_episode_length_search("Monster")

def anime_date_release_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    anime_date_release_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "startDate"
                                        anime_date_release_result = detail.to_s
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
    return anime_date_release_result
end

# anime_date_release_search("Monster")

def anime_status_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    pp anime_hash
    anime_status_result = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "status"
                                        anime_status_result = detail.to_s
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
    return anime_status_result
end

anime_status_search("Monster")

def anime_image_search(anime_name)
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    image_url = ""
    anime_hash["data"].map do |key|
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "posterImage"
                                        detail.each do |size,url|
                                            if size == "original"
                                                image_url = url
                                            end
                                        end
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
        return image_url
    end
end

# anime_image_search("Monster")



# def testing(anime_name)
#     anime_name_hash = []
#     anime_name_hash << anime_name.downcase.split(" ")
#     anime_name_hash = anime_name_hash.join("%20")
#     puts anime_name_hash
#     url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
#     puts url
# end

# testing("Attack on titan")


