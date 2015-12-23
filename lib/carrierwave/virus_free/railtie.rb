# heavily borrowed from https://github.com/carrierwaveuploader/carrierwave/blob/ecf57fe5fed17657b258d708a59feeec9fac74cd/lib/carrierwave.rb

module CarrierWave
  module VirusFree
    if defined? Rails
      class Railtie < Rails::Railtie
        initializer "carrierwave_virus_free.setup_paths" do |app|
          pattern = CarrierWave::VirusFree::Railtie.locales_pattern_from app.config.i18n.available_locales

          files = Dir[File.join(File.dirname(__FILE__), 'locale', "#{pattern}.yml")]
          # Loads the Carrierwave locale files before the Rails application locales
          # letting the Rails application overrite the carrierwave locale defaults
          I18n.load_path = files.concat I18n.load_path
        end

        private

        def self.locales_pattern_from(args)
          array = Array(args || [])
          array.blank? ? '*' : "{#{array.join ','}}"
        end
      end
    end
  end
end
