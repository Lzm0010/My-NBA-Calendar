require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'


url = URI("https://api-nba-v1.p.rapidapi.com/seasons/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '9daf1f4c35mshdf9c1ef6a1e06e8p16d72bjsnfd410afab7c5'

response = http.request(request)
# hash = JSON.parse(response.body)
ap response