#!/usr/bin/env ruby

Dir.chdir(File.join(File.dirname(__FILE__), 'dotfiles')) do
  Dir.glob('*').each do |file|
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("rm -v #{destination}")
  end
end