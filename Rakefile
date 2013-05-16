namespace :install do
  task :dotfiles do
    Files.each('dotfiles') do |file|
      directory = File.directory?(file)
      source = directory ? Dir.glob(File.join(Dir.pwd, file, '**')) : File.join(Dir.pwd, file)
      destination = File.join(ENV['HOME'], ".#{file}")

      FileUtils.mkdir_p(destination) if directory

      FileUtils.symlink(source, destination, force: true)
    end
  end

  task :bin do
    Files.each('bin') do |file|
      source = File.join(Dir.pwd, file)
      destination = File.join('/', 'usr', 'local', 'bin', file)

      FileUtils.chmod('+x', source)
      FileUtils.mkdir_p(File.dirname(destination))

      FileUtils.symlink(source, destination, force: true)
    end
  end

  task :sublime do
    Files.each('Sublime Text') do |file|
      source = File.join(Dir.pwd, file)
      destination = File.join(ENV['HOME'], 'Library', 'Application Support', 'Sublime Text 3', 'Packages', 'User', file)

      FileUtils.mkdir_p(File.dirname(destination))

      FileUtils.symlink(source, destination, force: true)
    end
  end
end

task :install do
  Rake::Task['install:dotfiles'].invoke
  Rake::Task['install:bin'].invoke
  Rake::Task['install:sublime'].invoke
end

namespace :uninstall do
  task :dotfiles do
    Files.each('dotfiles') do |file|
      destination = File.join(ENV['HOME'], ".#{file}")

      FileUtils.rm_rf(destination)
    end
  end

  task :bin do
    Files.each('bin') do |file|
      destination = File.join('/', 'usr', 'local', 'bin', file)

      FileUtils.rm_rf(destination)
    end
  end

  task :sublime do
    Files.each('Sublime Text') do |file|
      destination = File.join(ENV['HOME'], 'Library', 'Application Support', 'Sublime Text 3', 'Packages', 'User', file)

      FileUtils.rm_rf(destination)
    end
  end
end

task :uninstall do
  Rake::Task['uninstall:dotfiles'].invoke
  Rake::Task['uninstall:bin'].invoke
  Rake::Task['uninstall:sublime'].invoke
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
