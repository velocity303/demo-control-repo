class role::consul {
  include profile::baseline
  include profile::inf::consul::server
}
