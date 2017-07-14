class RequestController < ApplicationController
    def get_data
        notification_message = Nokogiri::XML(request.body.read)
        Req.create(content: notification_message)
    end
end
