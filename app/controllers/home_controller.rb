class HomeController < ApplicationController
    require 'rest-client'

    def main
        uri = URI('https://thingplugpf.sktiot.com:9443/0240771000000174/v1_0/remoteCSE-00000174d02544fffef01031/container-LoRa/latest')
       # http = Net::HTTP.new(uri.host, uri.port)
    #    http.use_ssl = true
    #    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #    @res = Net::HTTP::Get.new("https://thingplugpf.sktiot.com:9443/0240771000000174/v1_0/remoteCSE-00000174d02544fffef01031/container-LoRa/latest")


        #Net::HTTP.start(uri.host, uri.port) do |http|
        #  request = Net::HTTP::Get.new(uri.request_uri)
        
          #request = http.request request # Net::HTTPResponse object
        #end
        
        #@res=request
        @posted = Req.all
    end
end
