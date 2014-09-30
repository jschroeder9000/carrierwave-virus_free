require 'clam_scan'

module CarrierWave
  module VirusFree
    class VirusFreeValidator < ActiveModel::EachValidator
      def validate_each (record, attribute, value)
        if value.present? && !ClamScan::Client.scan(location: value.url).safe?
          record.errors.add(attribute, 'That file can not be accepted')
        end
      end
    end
  end
end

ActiveModel::Validations.include CarrierWave::VirusFree
