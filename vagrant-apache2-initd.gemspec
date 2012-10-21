# -*- encoding: utf-8 -*-
require File.expand_path("../lib/vagrant-apache2-initd/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "vagrant-apache2-initd"
  s.version     = VagrantApache2::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian Kusnier"]
  s.email       = ["sebastian@kusnier.net"]
  s.homepage    = "https://github.com/kusnier/vagrant-apache2-initd"
  s.summary     = "A Vagrant plugin to execute initd commands for apache2 in the VM"
  s.description = "A Vagrant plugin to execute initd commands for apache2 in the VM"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vagrant-apache2-initd2"

  s.add_dependency "vagrant", ">= 1.0.4"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
