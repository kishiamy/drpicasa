class Photo < ActiveRecord::Base
  attr_accessible :image_path
  belongs_to :album

  def get_photos_from_album
    @request_xml = RestClient.get("https://picasaweb.google.com/data/feed/api/user/default/albumid/albumID", 
                                  headers = { Gdata: 2,
                                              Authorization: "OAuth #{@token}" })
    @a_xml = Nokogiri::XML(@request_xml) do |config|
      config.strict.nonet
    end

    @photos = @albums_xml.xpath('//xmlns:entry').map do |entry|
    # @photos = @albums_xml.xpath('//media:group')[0..2].map do |entry|
      {
        :thumb => entry.xpath('.//media:thumbnail').attr("url")
      }
    end

  end

end
