#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#Update the apt cache
export DEBIAN_FRONTEND=noninteractive
/usr/bin/apt-get --quiet update
/usr/bin/apt-get --quiet --yes --no-install-recommends --show-upgraded upgrade
/usr/bin/apt-get --quiet --yes --purge autoremove

#install dependencies
/usr/bin/apt-get --quiet --yes install ruby ruby-dev libopenssl-ruby rdoc ri \
	irb build-essential wget ssl-cert git-core

#install rubygems from source
cd /tmp
/usr/bin/wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
/bin/tar zxf rubygems-1.3.7.tgz
cd rubygems-1.3.7
/usr/bin/ruby setup.rb --no-format-executable

#install chef
/usr/bin/gem install --no-ri --no-rdoc chef

#install chef repository
cd ~/
/usr/bin/git clone git://github.com/opscode/chef-repo.git

#create .chef directory and setup keys
mkdir -p ~/chef-repo/.chef

#how to automate this???
cp USERNAME.pem ~/chef-repo/.chef
cat >~/chef-repo/.chef/pgroudas.pem <<END
:PGROUDAS.PEM
END

cat >~/chef-repo/.chef/pgdotcom-validator.pem <<END
:PGDOTCOM-VALIDATOR.PEM
END

cat >~/chef-repo/.chef/knife.rb <<END
:KNIFE.RB
END

cd ~/chef-repo
/usr/bin/knife configure client ./client-config
cp -r ~/chef-repo/client-config /etc/chef

/usr/bin/chef-client
