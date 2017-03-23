class User < ApplicationRecord
  has_secure_password
  require 'securerandom'

  # validates :name, presence: true
  # validates :mobile_phone_number, presence: true, uniqueness: true
  # validates :email_address, presence: true, uniqueness: true
  # validates :physical_address, presence: true
  has_many :bids
  has_many :auction_admins
  has_many :authentification

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end


  def self.create_with_omniauth(auth)
    create! do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.password = SecureRandom.urlsafe_base64
    end
end

end
