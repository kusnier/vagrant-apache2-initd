require 'vagrant'
require 'vagrant-apache2-initd/command'

Vagrant.commands.register(:apache2) { VagrantApache2::Command::Apache2 }

# Add our custom translations to the load path
I18n.load_path << File.expand_path("../../locales/en.yml", __FILE__)
