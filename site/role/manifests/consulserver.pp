class role::consulserver {
  include profile::baseline
  include profile::inf::consul::server
}
