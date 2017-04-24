class profile::baseline::path {
  file { '/etc/profile.d/path.sh':
    ensure  => file,
    content => '#!/bin/bash
if [ -d "/opt/puppetlabs/bin" ] ; then
  PATH="/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin:$PATH"
fi',
    mode    => '0700',
  }
}
