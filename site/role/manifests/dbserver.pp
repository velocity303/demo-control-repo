class role::dbserver {
  include profile::db::pgsqlserver
  include profile::db::mysqlserver
  include profile::firewall::mysql
  include profile::firewall::pgsql
}
