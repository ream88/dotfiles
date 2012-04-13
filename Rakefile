namespace :install do
  task :dotfiles do
    Files.each('dotfiles') do |file|
      source = File.join(Dir.pwd, file)
      destination = File.join(ENV['HOME'], ".#{file}")
      
      system("ln -vsf #{source} #{destination}")
    end
  end

  task :bin do
    Files.each('bin') do |file|
      source = File.join(Dir.pwd, file)
      destination = File.join('/', 'usr', 'local', 'bin', file)
      
      FileUtils.chmod('+x', source)
      FileUtils.mkdir_p(File.dirname(destination))
      
      system("ln -vsf #{source} #{destination}")
    end
  end
end

task :install do
  Rake::Task['install:dotfiles'].invoke
  Rake::Task['install:bin'].invoke
end

namespace :uninstall do
  task :dotfiles do
    Files.each('dotfiles') do |file|
      destination = File.join(ENV['HOME'], ".#{file}")
      
      system("rm -v #{destination}")
    end
  end

  task :bin do
    Files.each('bin') do |file|
      source = File.join(Dir.pwd, file)
      destination = File.join('/', 'usr', 'local', 'bin', file)
      
      system("rm -v #{destination}")
    end
  end
end

task :uninstall do
  Rake::Task['uninstall:dotfiles'].invoke
  Rake::Task['uninstall:bin'].invoke
end

task default: :install

class Files
  def self.each(dir, &block)
    Dir.chdir(File.join(File.dirname(__FILE__), dir)) do
      Dir.glob('*').each do |file|
        yield file
      end
    end
  end
end
