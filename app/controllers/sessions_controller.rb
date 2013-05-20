class SessionsController < ApplicationController

  def albums
    token = request.env["omniauth.auth"].credentials.token
    request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
                  headers = { Gdata: 2,
                              Authorization: "OAuth #{token}" })

    albums_xml = Nokogiri::XML(request_xml) 

    @albums = albums_xml.xpath('//xmlns:entry').map do |entry|
      {
        :thumb => entry.xpath('//media:thumbnail').attr("url"),
        :title => entry.xpath('//media:title').inner_text
      }
    end
  end

  def login
  end

end