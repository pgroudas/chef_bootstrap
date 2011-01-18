require 'rake/clean'

CLEAN.include('dist/*')

task :dist do
  chef_install = IO.read('src/chef_install.sh')  
  pgroudas_pem = IO.read('src/credentials/pgroudas.pem')
  pg_dot_com_validator_pem = IO.read('src/credentials/pgroudas.pem')
  
  chef_install.gsub!(/:PGROUDAS.PEM/,pgroudas_pem)
  chef_install.gsub!(/:PGDOTCOM-VALIDATOR.PEM/,pg_dot_com_validator_pem)  
  chef_install.gsub!(/:KNIFE.RB/,IO.read('src/knife.rb'))
  File.open('dist/chef_install.sh','w+') { |output_file| output_file.puts chef_install }
end

task :default => ['clean', 'dist']
