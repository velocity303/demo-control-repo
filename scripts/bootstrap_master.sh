#/bin/bash
server_name=$1
is_ec2=$2

function ec2_setup {
  setenforce 0
  sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
  ntpdate -u 0.amazon.pool.ntp.org
  /sbin/parted -s /dev/xvdb mklabel gpt
  /sbin/parted -s /dev/xvdb mkpart primary 0% 100%
  /sbin/mkfs.ext4 /dev/xvdb1
  mount /dev/xvdb1 /opt
  echo "/dev/xvdb1              /opt                    ext4    defaults        0 2" >> /etc/fstab
  lsblk
}

function setup_networking {
  echo "$server_name" > /etc/hostname
  hostname $server_name
  echo "127.0.0.1 $server_name puppet localhost.localdomain localhost" > /etc/hosts
}

function configure_puppetmaster {
  echo "dns_alt_names = $server_name,puppet" >> /etc/puppetlabs/puppet/puppet.conf
  echo '[agent]' >> /etc/puppetlabs/puppet/puppet.conf
  echo "server = puppet" >> /etc/puppetlabs/puppet/puppet.conf
  sleep 5
  cat > /etc/puppetlabs/puppet/csr_attributes.yaml << YAML
extension_requests:
    pp_role:  puppetmaster
YAML
}

function copy_ssh_keys {
  mkdir -p /etc/puppetlabs/puppetserver/ssh
  if [ -d /vagrant/keys ]
    then
      echo "Vagrant keys directory exists. Copying them in place"
      cp /vagrant/keys/id_rsa /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
      cp /vagrant/keys/id_rsa.pub /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa.pub
      mkdir -p ~/.ssh
      echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
      cp /vagrant/keys/id_rsa ~/.ssh/id_rsa
      cp /vagrant/keys/id_rsa.pub ~/.ssh/id_rsa.pub
    else
      echo "Vagrant keys directory does not exists. Creating them"
      ssh-keygen -t rsa -b 4096 -N"" -f /etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa
  fi
}


function setup_hiera_pe {
  sleep 15
  /opt/puppetlabs/bin/puppet apply -e "include profile::puppet::pe::hiera"
  /opt/puppetlabs/bin/puppetserver gem install hiera-eyaml
  if [ -f /vagrant/keys/private_key.pkcs7.pem ]
    then
      rm /etc/puppetlabs/puppet/keys/*
      cp /vagrant/keys/private_key.pkcs7.pem /etc/puppetlabs/puppet/keys/.
      cp /vagrant/keys/public_key.pkcs7.pem /etc/puppetlabs/puppet/keys/.
  fi
}

function run_puppet {
  cd /
  /opt/puppetlabs/bin/puppet agent -t
}

function download_pe {
  yum -y install wget pciutils
  wget https://s3.amazonaws.com/pe-builds/released/2016.2.1/puppet-enterprise-2016.2.1-el-7-x86_64.tar.gz
  tar -xzf puppet-enterprise-2016.2.1-el-7-x86_64.tar.gz -C /tmp/
}

function install_pe {
  mkdir -p /etc/puppetlabs/puppet
  cat > /tmp/pe.conf << FILE
"console_admin_password": "puppet"
"puppet_enterprise::puppet_master_host": "%{::trusted.certname}"
"puppet_enterprise::profile::master::code_manager_auto_configure": true
"puppet_enterprise::profile::master::r10k_remote": "https://github.com/velocity303/demo-control-repo.git"
"puppet_enterprise::profile::master::r10k_private_key": "/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa"
FILE
  /tmp/puppet-enterprise-2016.2.1-el-7-x86_64/puppet-enterprise-installer -c /tmp/pe.conf
  chown pe-puppet:pe-puppet /etc/puppetlabs/puppetserver/ssh/id-*
}

function add_pe_users {
  /opt/puppetlabs/bin/puppet module install pltraining-rbac
  cat > /tmp/user.pp << FILE
rbac_user { 'deploy':
    ensure       => 'present',
    name         => 'deploy',
    display_name => 'deployment user account',
    email        => 'james.jones@puppet.com',
    password     => 'puppetlabs',
    roles        => [ 'Code Deployers' ],
}

FILE
  /opt/puppetlabs/bin/puppet apply /tmp/user.pp
  rm /tmp/user.pp

  /opt/puppetlabs/bin/puppet-access login deploy --lifetime=1y << TEXT
puppetlabs

TEXT
}

function deploy_code_pe {
  /opt/puppetlabs/bin/puppet-code deploy production -w
}

if [ $is_ec2 == 'true' ]
  then
    ec2_setup
fi

setup_networking
download_pe
copy_ssh_keys
install_pe
add_pe_users
deploy_code_pe
setup_hiera_pe
run_puppet
