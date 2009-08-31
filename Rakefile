#!/usr/bin/env ruby
require 'rubygems'
require 'rake'
require 'hoe'

PKG_DESC    = "A secure non evaling end user template engine with aesthetic markup."

Hoe.spec "liquid" do
  developer("Tobias Luetke", "tobi@leetsoft.com")
end


namespace :profile do

  
  task :default => [:run]
  
  desc "Run the liquid profile/perforamce coverage"
  task :run do
  
    ruby "performance/shopify.rb"
  
  end
  
  desc "Run KCacheGrind" 
  task :grind => :run  do
    system "kcachegrind /tmp/liquid.rubyprof_calltreeprinter.txt"
  end
end
  
  