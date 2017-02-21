require 'active_model'
require 'clam_scan'

require 'carrierwave/virus_free/railtie'
require 'carrierwave/virus_free/version'
require 'carrierwave/virus_free/virus_free_validator'

module CarrierWave
  module VirusFree
  end
end

ActiveModel::Validations.send :include, CarrierWave::VirusFree
