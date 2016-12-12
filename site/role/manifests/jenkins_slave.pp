# This is a role for a jenkins slave
class role::jenkins_slave {
  include profile::baseline
  include profile::inf::jenkins::slave
}
