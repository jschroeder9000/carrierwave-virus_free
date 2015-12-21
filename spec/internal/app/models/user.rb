class User < ActiveRecord::Base
  mount_uploader :avatar, CarrierWave::Uploader::Base
  validates :avatar, virus_free: true
end
