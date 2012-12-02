class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :provider, :uid

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"] unless auth["provider"].blank?
      user.uid = auth["uid"] unless auth["uid"].blank?
    end
  end
end
