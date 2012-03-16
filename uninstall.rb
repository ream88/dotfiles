#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__)) do
  Dir.entries(Dir.pwd).grep(/^[^\.]+$/).each do |file|
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("rm -v #{destination}") if File.exist?(destination)
  end
end