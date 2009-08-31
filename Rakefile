#!/usr/bin/env ruby
require 'rubygems'
require 'rake'
require 'hoe'

Hoe.spec "liquid" do
  developer("Tobias Luetke", "tobi@leetsoft.com")
  self.readme_file = "README.rdoc"
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
  
  