class RequestController < ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:get_data]
    def get_data
        @doc = Nokogiri::XML(request.body.read)
       	puts(@doc)

        # parser
        # sty, ri, rn, pi, ct, lt, ppt<gwl, geui>, sr, et, st, cr, cnf, cs, con
        ty_r = @doc.css('ty')     # resource type as enum(3: container, 4: contentInstance, 7: execInstance, 12: mgmtCmd, 14: node, 16: remoteCSE)
	    ty_r = ty_r[0].text.split(">")
	    ty = ty_r[0].to_i
	    puts('ty : ',ty)

        ri_r = @doc.css('ri')     # resource identifier(리퀘스트 메시지 고유 식별자)
	    ri_r = ri_r[0].text.split(">")
	    ri = ri_r[0]

        rn_r = @doc.css('rn')     # resource name
	    rn_r = rn_r[0].text.split(">")
	    rn = rn_r[0]

        pi_r = @doc.css('pi')     
	    pi_r = pi_r[0].text.split(">")
	    pi = pi_r[0]

        ct_r = @doc.css('ct')
	    ct_r = ct_r[0].text.split(">")
	    ct = DateTime.iso8601(ct_r[0])
	    puts('ct : ',ct)

        lt_r = @doc.css('lt')     # last modified name of resource
	    lt_r = lt_r[0].text.split(">")
	    lt = DateTime.iso8601(lt_r[0])
	    puts('lt : ',lt)

        ppt = @doc.css('ppt')
	    ppt = ppt[0].text.split(">")
	    puts('ppt : ',ppt)

        gwl_r = @doc.css('gwl')   # seems latlng
	    gwl_r = gwl_r[0].text.split(">")
	    gwl = gwl_r[0]
	    puts('gwl : ', gwl)
        values_g = gwl.split(",")
	    puts('valg : ', values_g[0])
        lat = values_g[0].to_f
        lng = values_g[1].to_f

        geui_r = @doc.css('geui')
	    geui_r = geui_r[0].text.split(">")
    	geui = geui_r[0]

        sr_r = @doc.css('sr')      # request uri
	    sr_r = sr_r[0].text.split(">")
	    sr = sr_r[0]
        values_u = sr.split("/")
	    app_eui = values_u[1]
        ltid_r = values_u[3]
	    ltid_r = ltid_r.split("-")
	    ltid = ltid_r[1]

        et_r = @doc.css('et')     # expriation time(리소스 유효기간)
	    et_r = et_r[0].text.split(">")
	    et = DateTime.iso8601(et_r[0])

        st_r = @doc.css('st')     # state tag 
	    st_r = st_r[0].text.split(">")
	    st = st_r[0].to_i

        cr_r = @doc.css('cr')     # data sender indentifier(데이터 고유 식별자)
	    cr_r = cr_r[0].text.split(">")
	    cr = cr_r[0]

        cnf_r = @doc.css('cnf')   # data type
	    cnf_r = cnf_r[0].text.split(">")
	    cnf = cnf_r[0]

        cs_r = @doc.css('cs')     # content size
	    cs_r = cs_r[0].text.split(">")
	    cs = cs_r[0].to_i

        con_r = @doc.css('con')   # content(raw data)
	    con_r = con_r[0].text.split(">")
	    con = con_r[0]

	    val_r = con.split("9909")
	    pm2_5 = val_r[1].to_i(16)
	    pm10 = val_r[2].to_i(16)

        puts('lat : ', lat)
        puts('lng : ', lng)
	    puts('app_eui : ', app_eui)
        puts('ltid : ', ltid)
	    puts('pm2_5 : ', pm2_5)
	    puts('pm10 : ', pm10)
	
	    Request.create(ty:ty,ri:ri,rn:rn,pi:pi,ct:ct,lt:lt,gwl:gwl,lat:lat,lng:lng,geui:geui,sr:sr,app_eui:app_eui,ltid:ltid,et:et,st:st,cr:cr,cnf:cnf,cs:cs,con:con,PM2_5:pm2_5,PM10:pm10)

    end
end
