# This is a role for a jenkins master server
class role::jenkins_master {
  include profile::baseline
  include profile::inf::jenkins::master
  include puppet_enterprise::profile::controller
}
