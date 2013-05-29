class SessionsController < ApplicationController

  #TODO: separate get token,get albums and get photos in different methods
  def albums
    token = request.env["omniauth.auth"].credentials.token
    request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
                                  headers = { Gdata: 2,
                                              Authorization: "OAuth #{token}" })
    session[:params] = token

    albums_xml = Nokogiri::XML(request_xml) do |config|
      config.strict.nonet
    end
    
    @albums = albums_xml.xpath('//xmlns:entry').map do |entry|
      {
        :title => entry.xpath('.//media:title').inner_text,
        :thumb => entry.xpath('.//media:thumbnail').attr("url")
      }
    end
 
    @photos = albums_xml.xpath('//media:group')[0..2].each do |entry|
      {
        :thumb => entry.xpath('.//media:thumbnail').attr("url")
      }
    end
  end

  def photos
  end

  def login
  end

end