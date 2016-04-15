#!/bin/env ruby
# encoding: utf-8


#require 'selenium-webdriver'
require 'watir-webdriver'
require 'rake'
require 'rest-client'
#require 'nokogiri'
require 'rspec/expectations'
require 'cucumber'
require 'pry'
require 'require_all'

require_all 'lib'

ffprofile = Selenium::WebDriver::Firefox::Profile.new
# Disable Disk Caching in firefox because of problems with display on windows
ffprofile['browser.cache.disk.enable'] = false
ffprofile['browser.cache.disk.capacity'] = 0

# Firefox performance settings
ffprofile['network.http.pipelining'] = true
ffprofile['network.http.pipelining.maxrequests'] = 8
ffprofile['network.http.pipelining.aggressive'] = true
ffprofile['nglayout.initialpaint.delay'] = 0
ffprofile['browser.cache.use_new_backend'] = 1
ffprofile['network.prefetch-next'] = true
ffprofile['browser.tabs.animate'] = false
ffprofile['browser.display.show_image_placeholders'] = false
ffprofile['network.dns.disableIPv6'] = true
ffprofile['content.notify.backoffcount'] = 5
ffprofile['gfx.direct2d.disabled'] = true
ffprofile['layers.acceleration.disabled'] = true


case ENV['BROWSER']
  when /firefox/i
    browser = Watir::Browser.new :firefox, profile: ffprofile
    browser.window.resize_to(1240, 768)
  when /chrome/i
    browser = Watir::Browser.new :chrome
    browser.window.resize_to(1240, 768)
  when /ie/i
    browser = Watir::Browser.new :ie
    browser.window.resize_to(1240, 768)
end


class CustomWorld
  class << self
    attr_accessor :browser
  end

  def exxon_site
    @exxon_site ||= ExxonBase.new(CustomWorld.browser)
  end

  def bbc_site
    @bbc_site ||= BBCBase.new(CustomWorld.browser)
  end

end

CustomWorld.browser = browser

World do
  CustomWorld.new
end

at_exit do
  browser.close
end