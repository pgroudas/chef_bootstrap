require 'rake/clean'

CLEAN.include('dist/*')

task :dist do
  mkdir('dist/bin')
  chef_install = IO.read('src/scripts/chef_install.sh')  
  pgroudas_pem = IO.read('src/credentials/pgroudas.pem')
  pg_dot_com_validator_pem = IO.read('src/credentials/pgdotcom-validator.pem')
  
  chef_install.gsub!(/:PGROUDAS.PEM/,pgroudas_pem.chomp)
  chef_install.gsub!(/:PGDOTCOM-VALIDATOR.PEM/,pg_dot_com_validator_pem.chomp)  
  chef_install.gsub!(/:KNIFE.RB/,IO.read('src/knife.rb'))
  File.open('dist/bin/chef_install.sh','w+',0655) { |output_file| output_file.puts chef_install }

  cp('src/scripts/launch_ec2_instance.sh','dist/bin/launch_ec2_instance.sh')
  chmod(0755, %w{dist/bin/launch_ec2_instance.sh dist/bin/chef_install.sh})
end

task :default => ['clean', 'dist']
