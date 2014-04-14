namespace :install do
  task :dotfiles do
    Rake::FileList.new(File.expand_path('../dotfiles/*', __FILE__)).each do |source|
      symlink source, source.pathmap("#{ENV['HOME']}/.%f"), force: true
    end
  end

  task :bin do
    Rake::FileList.new(File.expand_path('../bin/*', __FILE__)).each do |source|
      dest = source.pathmap('/usr/local/bin/%f')

      symlink source, dest, force: true
      chmod '+x', dest
    end
  end

  task :sublime do
    Rake::FileList.new(File.expand_path('../Sublime Text/*', __FILE__)).each do |source|
      sublime = File.join(ENV['HOME'], 'Library', 'Application Support', 'Sublime Text 3', 'Packages', 'User')
      dest = source.pathmap("#{sublime}/%f")

      symlink source, dest, force: true
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
    Rake::FileList.new(File.expand_path('../dotfiles/*', __FILE__)).each do |source|
      rm_rf source.pathmap("#{ENV['HOME']}/.%f")
    end
  end

  task :bin do
    Rake::FileList.new(File.expand_path('../bin/*', __FILE__)).each do |source|
      rm_rf source.pathmap('/usr/local/bin/%f')
    end
  end

  task :sublime do
    Rake::FileList.new(File.expand_path('../Sublime Text/*', __FILE__)).each do |source|
      sublime = File.join(ENV['HOME'], 'Library', 'Application Support', 'Sublime Text 3', 'Packages', 'User')

      rm_rf source.pathmap("#{sublime}/%f")
    end
  end
end

task :uninstall do
  Rake::Task['uninstall:dotfiles'].invoke
  Rake::Task['uninstall:bin'].invoke
  Rake::Task['uninstall:sublime'].invoke
end

task default: :install
