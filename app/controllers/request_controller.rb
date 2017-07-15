class RequestController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:get_data]
    def get_data
        notification_message = Nokogiri::XML(request.body.read)
        puts(notification_message)

        doc = Nokogiri::XML.parse(notification_message)
        
        # parser
        # sty, ri, rn, pi, ct, lt, ppt<gwl, geui>, sr, et, st, cr, cnf, cs, con
        ty = doc.css("ty")     # resource type as enum(3: container, 4: contentInstance, 7: execInstance, 12: mgmtCmd, 14: node, 16: remoteCSE)
        ri = doc.css("ri")     # request identifier(리퀘스트 메시지 고유 식별자)
        rn = doc.css("rn")     # resource name
        pi = doc.css("pi")     
        ct = doc.css("ct")
        lt = doc.css("lt")     # last modified name of resource
        ppt = doc.css("ppt")
        gwl = doc.css("gwl")   # seems latlng
        values_g = gwl.split(",")
        lat = values_g[0].to_f
        lng = values_g[1].to_f
        geui = doc.css("geui")
        sr = doc.css("sr")      # request uri
        values_u = sr.split("/")
        dev_id = values_u[3]
        et = doc.css("et")     # expriation time(리소스 유효기간)
        st = doc.css("st")     # state tag 
        cr = doc.css("cr")     # data sender indentifier(데이터 고유 식별자)
        cnf = doc.css("cnf")   # data type
        cs = doc.css("cs")     # content size
        con = doc.css("con")   # content(raw data)

        puts('lat : ', lat)
        puts('lng : ', lng)
        puts('dev_id : ', dev_id)

        Req.create(content: notification_message)
    end
end
