current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pgroudas"
client_key               "#{current_dir}/pgroudas.pem"
validation_client_name   "pgdotcom-validator"
validation_key           "#{current_dir}/pgdotcom-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/pgdotcom"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
