task :install do
  Dotfiles.each do |file|
    source = File.join(Dir.pwd, file)
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("ln -vsf #{source} #{destination}")
  end
end

task :uninstall do
  Dotfiles.each do |file|
    destination = File.join(ENV['HOME'], ".#{file}")
    
    system("rm -v #{destination}")
  end
end

task default: :install

class Dotfiles
  def self.each(&block)
    Dir.chdir(File.join(File.dirname(__FILE__), 'dotfiles')) do
      Dir.glob('*').each do |file|
        yield file
      end
    end
  end
end