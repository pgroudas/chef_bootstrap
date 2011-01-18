require 'rake/clean'

CLEAN.include('dist/*')

task :dist do
  cp('src/chef_install', File.join('dist','chef_install.sh'), :verbose => true)
end

task :default => ['clean', 'dist']
