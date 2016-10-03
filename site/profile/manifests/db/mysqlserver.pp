class profile::db::mysqlserver (
  $db_port         = '3306',
  $listen_ip       = '0.0.0.0',
  $collect_exports = true,
) {

  class { 'mysql::server':
    override_options => {
      'mysqld' => {
        'bind_address' => $listen_ip,
        'port'         => $db_port,
      },
    },
  }

  if $collect_exports {
    Profile::Db::Mysql::Export <<| |>>
  }

}
