# Carrierwave::VirusFreeValidator

Validate carrierwave uploads are virus free with clamav.

## Installation

Add this line to your application's Gemfile:

    gem 'carrierwave-virus_free_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-virus_free_validator

## ClamScan Dependency

This gem requires the _clam_scan_ gem which requires that you have ClamAV installed.  You may also need to configure it according to your needs - pointing it to the right location to clamscan/clamdscan on your system, setting it to delete infected files, etc.  See the _clam_scan_ gem documentation for more details.

## Usage

```ruby
ClamScan.configure do |config|
  # see clam_scan documentation for details
end

class MyModel < ActiveRecord::Base
  mount_uploader :file, MyUploader

  validates :file, virus_free: true
end
```

It's that easy.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/carrierwave-virus_free_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
