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

## I18n

Validation error messages are processed through I18n.  See [lib/carrierwave/virus_free/locale/en.yml](https://github.com/jschroeder9000/carrierwave-virus_free/blob/master/lib/carrierwave/virus_free/locale/en.yml) for default messages and relevant keys to override.

## Lazy validation

As of 0.1.0, validation is lazy in that it does nothing if the model attribute with the uploader mounted has not changed.  This increases compatibility in cases where the final storage location of a file is not local, but also implies that a file _could_ be changed to something malicious by an external process and would not be caught by further validation.  E.g.:

* User uploads safe file which gets saved somewhere
* Some external process overwrites this file with something malicious
* You call `model.valid?` and it returns true because your model is not aware of the file changing (`model.file_changed?` is false) even though the file is now something that clamav would catch as malicious

Please be aware of this caveat.  You can protect against this by preventing external processes from modifying you application's files and/or you can use [clam_scan](https://github.com/jschroeder9000/clam_scan) directly.

## Contributing

1. Fork it ( https://github.com/jschroeder9000/carrierwave-virus_free_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
