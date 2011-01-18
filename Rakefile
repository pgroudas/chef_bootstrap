require 'rake/clean'

CLEAN.include('dist/*')

task :dist do
  pgroudas_pem = IO.read('src/credentials/pgroudas.pem')
  File.open('dist/chef_install.sh','w+') do |output_file|
    output_file.puts IO.read('src/chef_install.sh').gsub(/:PGROUDAS.PEM/, pgroudas_pem)
  end
end

task :default => ['clean', 'dist']
