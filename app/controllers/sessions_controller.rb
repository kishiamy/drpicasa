class SessionsController < ApplicationController

  def albums
    token = request.env["omniauth.auth"].credentials.token
    request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
                                  headers = { Gdata: 2,
                                              Authorization: "OAuth #{token}" })

    albums_xml = Nokogiri::XML(request_xml) do |config|
      config.strict.nonet
    end
    
    @albums = albums_xml.xpath("//xmlns:entry").map do |entry|
      {
         :title => entry.xpath('.//media:title').inner_text,
        :thumb => entry.xpath('.//media:thumbnail').attr("url")  
      }
    end
  end

  def logi
  end

end