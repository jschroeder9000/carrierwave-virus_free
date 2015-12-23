module CarrierWave
  module VirusFree
    class VirusFreeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return unless record.send :"#{attribute}_changed?"

        response = ClamScan::Client.scan(location: value.path)
        if response.error? || response.unknown?
          record.errors.add attribute, :virus_free_error
        elsif !response.safe?
          record.errors.add attribute, :virus_free_unsafe
        end
      end
    end
  end
end
