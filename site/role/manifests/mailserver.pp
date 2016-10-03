class role::mailserver {
  include profile::mail::dovecot
  include profile::mail::postfix
  include profile::mail::opendkim
  include profile::mail::mailusers
  include profile::mail::roundcube
  include profile::baseline
  include profile::firewall::webtraffic
  include profile::firewall::mailserver
}
