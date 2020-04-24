#!/usr/bin/env ruby
exclude = Regexp.union(
  '.DS_Store',
  /\.md$/,
  'install.rb',
  'DefaultKeyBinding.dict'
)

Dir.glob('*')
  .reject { |file| file.match(exclude) }
  .map { |file| [File.join(Dir.pwd, file), File.join(Dir.home, ".#{file}")] }
  .each { |from, to| system("ln -sfvn #{from} #{to}") }
