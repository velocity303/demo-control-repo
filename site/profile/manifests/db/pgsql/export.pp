define profile::db::pgsql::export (
  $dbuser,
  $dbpass,
  $dbname = $title,
) {
  postgresql::server::db { $dbname:
    user     => $dbuser,
    password => postgresql_password($dbuser, $dbpass),
  }
}
