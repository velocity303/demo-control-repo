class profile::db::mysql {
  mysql::db { hiera('mysql_dbname'):
    user     => hiera('mysql_user'),
    password => hiera('mysql_pass'),
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
  }
}
