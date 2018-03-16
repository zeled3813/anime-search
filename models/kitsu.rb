require 'net/http'
require 'json'
require 'pp'
 
url = 'https://kitsu.io/api/edge/anime?page[limit]=1/anime?filter[text]=cowboy%20bebop'
uri = URI(url)
response = Net::HTTP.get(uri)
pp JSON.parse(response)

def anime_name_search(anime_name)
    anime_name_hash = []  #Creates an array that stores anime_name.
    anime_name_hash << anime_name.downcase.split(" ") #Split the words up when there is a space.
    anime_name_hash = anime_name_hash.join("%20") #Combine the words into one phrase with %20 replacing the spaces.
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash #Add the anime name to the end of the url, in order to filter the data.
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    name_result = "" #Creates an empty string.
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the title of the anime.
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
    return name_result #Return the string, with the name of the anime, as the return value of this method.
end


def anime_description_search(anime_name) #Checks the summary of the specific anime provided by the user.
    anime_name_hash = [] 
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    desc_result = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the summary of the anime.
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
    return desc_result #Return the string, with the summary of the anime, as the return value of this method.
end


def anime_episode_count_search(anime_name) #Checks the episode count of the anime
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    episode_count_result = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the episode count of the anime.
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
    return episode_count_result #Return the string, with the episode count of the anime, as the return value of this method.
end

def anime_episode_length_search(anime_name) #Checks the episode length of the anime.
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    episode_length_result = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the episode length of the anime.
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
    return episode_length_result #Return the string, with the episode length of the anime, as the return value of this method.
end


def anime_date_release_search(anime_name) #Checks the aired date for the anime
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    # pp anime_hash
    anime_date_release_result = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the date released/date aired of the anime.
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
    return anime_date_release_result #Return the string, with the date released/date aired of the anime, as the return value of this method.
end


def anime_status_search(anime_name) #Checks the anime's status: either currently ongoing or finished
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    pp anime_hash
    anime_status_result = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the status of the anime.
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
    return anime_status_result #Return the string, with the status of the anime, as the return value of this method.
end

def anime_image_search(anime_name) #Searches for the url that links to the original sized image.
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    image_url = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the url to the image of the anime.
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
        return image_url #Return the string, with the url for the image of the anime, as the return value of this method.
    end
end


def anime_video_search(anime_name) #Searches for the youtube video code from the JSON API
    anime_name_hash = []
    anime_name_hash << anime_name.downcase.split(" ")
    anime_name_hash = anime_name_hash.join("%20")
    url = 'https://kitsu.io/api/edge/anime?filter[text]=' + anime_name_hash
    uri = URI(url)
    response = Net::HTTP.get(uri)
    anime_hash = JSON.parse(response)
    video_code = ""
    anime_hash["data"].map do |key| #Iterate over all of the data hashes to obtain the youtube video code of the anime.
        key.each do |type_key,type_value|
            if type_key == "attributes"
                type_value.each do |category,detail|
                    if category == "titles"
                        detail.each do |language,title|
                            if language == "en" && title.downcase == anime_name.downcase
                                type_value.each do |category,detail|
                                    if category == "youtubeVideoId"
                                        video_code = "https://www.youtube.com/embed/" + detail
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
        return video_code #Return the string, with the youtube video code of the anime, as the return value of this method.
    end
end

