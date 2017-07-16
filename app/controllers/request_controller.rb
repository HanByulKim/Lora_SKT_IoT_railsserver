class RequestController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:get_data]
    def get_data
        @doc = Nokogiri::XML(request.body.read)
       	puts(@doc)

        # parser
        # sty, ri, rn, pi, ct, lt, ppt<gwl, geui>, sr, et, st, cr, cnf, cs, con
        ty_r = @doc.css('ty')     # resource type as enum(3: container, 4: contentInstance, 7: execInstance, 12: mgmtCmd, 14: node, 16: remoteCSE)
	ty = ty_r[0].text.split(">")
	tya = ty[0].to_i
	puts('ty : ',tya)
        ri = @doc.css('ri')     # request identifier(리퀘스트 메시지 고유 식별자)
	ri = ri[0].text.split(">")
        rn = @doc.css('rn')     # resource name
	rn = rn[0].text.split(">")
        pi = @doc.css('pi')     
	pi = pi[0].text.split(">")
        ct = @doc.css('ct')
	ct = ct[0].text.split(">")
        lt = @doc.css('lt')     # last modified name of resource
	lt = lt[0].text.split(">")
	puts('lt : ',lt)
        ppt = @doc.css('ppt')
	ppt = ppt[0].text.split(">")
	puts('ppt : ',ppt)
        gwl_r = @doc.css('gwl')   # seems latlng
	gwl = gwl_r[0].text.split(">")
	puts('gwl : ', gwl)
        values_g = gwl_r.text.split(",")
	puts('valg : ', values_g[0])
        lat = values_g[0].to_f
        lng = values_g[1].to_f
        geui = @doc.css('geui')
	geui = geui[0].text.split(">")
        sr_r = @doc.css('sr')      # request uri
	sr = sr_r[0].text.split(">")
        values_u = sr_r.text.split("/")
        dev_id = values_u[3]
        et = @doc.css('et')     # expriation time(리소스 유효기간)
	et = et[0].text.split(">")
        st = @doc.css('st')     # state tag 
	st = st[0].text.split(">")
        cr = @doc.css('cr')     # data sender indentifier(데이터 고유 식별자)
	cr = cr[0].text.split(">")
        cnf = @doc.css('cnf')   # data type
	cnf = cnf[0].text.split(">")
        cs = @doc.css('cs')     # content size
	cs = cs[0].text.split(">")
        con = @doc.css('con')   # content(raw data)
	con = con[0].text.split(">")

        puts('lat : ', lat)
        puts('lng : ', lng)
        puts('dev_id : ', dev_id)

    end
end
