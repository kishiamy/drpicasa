class SessionsController < ApplicationController

  #before_filter :get_token, :get_information

  def albums
    @token = request.env["omniauth.auth"].credentials.token

    @request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
                                  headers = { Gdata: 2,
                                              Authorization: "OAuth #{@token}" })
    @albums_xml = Nokogiri::XML(@request_xml) do |config|
      config.strict.nonet
    end

    session[:params] = @token
    
    @albums = @albums_xml.xpath('//xmlns:entry').map do |entry|
      {
        :title => entry.xpath('.//media:title').inner_text,
        :thumb => entry.xpath('.//media:thumbnail').attr("url")
      }
    end
  end

  def photos
    @photos = @albums_xml.xpath('//media:group')[0..2].each do |entry|
      {
        :thumb => entry.xpath('.//media:thumbnail').attr("url")
      }
    end
  end

  def login
  end

  # private

  # def get_token
  #   @token = request.env["omniauth.auth"].credentials.token
  # end

  # def get_information
  #   @request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
  #                                 headers = { Gdata: 2,
  #                                             Authorization: "OAuth #{@token}" })
  #   @albums_xml = Nokogiri::XML(@request_xml) do |config|
  #     config.strict.nonet
  #   end
  #   session[:params] = @token
  # end

end