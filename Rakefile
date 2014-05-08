namespace :install do
  task :dotfiles do
    Rake::FileList.new(__dir__ + '/dotfiles/*').each do |source|
      symlink source, source.pathmap("%{^#{__dir__}/dotfiles/,#{ENV['HOME']}/.}X"), force: true
    end
  end

  task :bin do
    Rake::FileList.new(__dir__ + '/bin/*').each do |source|
      dest = source.pathmap("%{^#{__dir__},/usr/local}X")

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
    Rake::FileList.new(__dir__ + '/dotfiles/*').each do |source|
      rm_rf source.pathmap("%{^#{__dir__}/dotfiles/,#{ENV['HOME']}/.}X")
    end
  end

  task :bin do
    Rake::FileList.new(__dir__ + '/bin/*').each do |source|
      rm_rf source.pathmap("%{^#{__dir__},/usr/local}X")
    end
  end
end

task :uninstall do
  Rake::Task['uninstall:dotfiles'].invoke
  Rake::Task['uninstall:bin'].invoke
end

task default: :install
