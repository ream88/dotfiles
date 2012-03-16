#!/usr/bin/env ruby

Dir.chdir(File.join(File.dirname(__FILE__), 'dotfiles')) do
  Dir.glob('*').each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("ln -vsf #{source} #{destination}")
  end
end