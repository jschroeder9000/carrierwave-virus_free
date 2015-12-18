Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.network :private_network, type: 'dhcp'

  config.vm.provider 'virtualbox' do |v|
    v.cpus = ENV['VAGRANT_CPUS'] || 4
    v.memory = ENV['VAGRANT_MEMORY'] || 1024
  end

  if ENV['VAGRANT_NFS']
    config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  elsif ENV['VAGRANT_RSYNC']
    config.vm.synced_folder '.', '/vagrant', type: 'rsync'
  end

  # install packages
  config.vm.provision 'shell', inline: <<-SCRIPT
    apt-get update &&
    apt-get -y install \
      clamav-daemon \
      git \
      libgmp-dev
  SCRIPT

  # disable clamav apparmor
  config.vm.provision 'shell', inline: <<-SCRIPT
    ln -s /etc/apparmor.d/local/usr.sbin.clamd /etc/apparmor.d/disable &&
    service apparmor restart
  SCRIPT

  # install ruby/rvm
  config.vm.provision 'shell', privileged: false, inline: <<-SCRIPT
    curl -sSL https://rvm.io/mpapis.asc | gpg --import - &&
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.4
  SCRIPT

  # install gems
  config.vm.provision 'shell', privileged: false, inline: <<-SCRIPT
    cd /vagrant &&
    gem install bundler &&
    bundle install
  SCRIPT
end
