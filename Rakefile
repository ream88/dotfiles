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
end

task :install do
  Rake::Task['install:dotfiles'].invoke
  Rake::Task['install:bin'].invoke
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
end

task :uninstall do
  Rake::Task['uninstall:dotfiles'].invoke
  Rake::Task['uninstall:bin'].invoke
end

task default: :install
