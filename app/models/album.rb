class Album < ActiveRecord::Base
  attr_accessible :albumID, :image_thumb, :title
  has_many :photos

  def get_album_information
    request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default", 
                                  headers = { Gdata: 2,
                                              Authorization: "OAuth #{@token}" })
    albums_xml = Nokogiri::XML(@request_xml) do |config|
      config.strict.nonet
    end

    @albums = albums_xml.xpath('//xmlns:entry').map do |entry|
      {
        :title => entry.xpath('.//media:title').inner_text,
        :thumb => entry.xpath('.//media:thumbnail').attr("url"),
        :albumid => entry.xpath('.//gphoto:id').inner_text
      }    
    end
  end

end
