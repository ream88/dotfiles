#!/usr/bin/env ruby

Dir.chdir(File.dirname(__FILE__)) do
  Dir.entries(Dir.pwd).grep(/^[^\.]+$/).each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("ln -vs #{source} #{destination}") unless File.exist?(destination)
  end
end