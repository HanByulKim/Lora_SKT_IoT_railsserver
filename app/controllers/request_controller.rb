class RequestController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:get_data]
    def get_data
        notification_message = Nokogiri::XML(request.body.read)
	puts(notification_message)
        Req.create(content: notification_message)
    end
end
