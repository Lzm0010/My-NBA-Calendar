require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'awesome_print'

class NbaApiCommunicator
###change end_point to get different NBA data

    def make_api_request_get_json(end_point)
        url = URI("https://api-nba-v1.p.rapidapi.com/" + end_point)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = ENV['APIHOST']
        request["x-rapidapi-key"] = ENV['APIKEY']

        response = http.request(request)
        JSON.parse(response.body)
    end

end