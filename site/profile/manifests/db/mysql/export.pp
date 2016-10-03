define profile::db::mysql::export (
  $dbuser,
  $dbpass,
  $dbname = $title,
) {
  mysql::db { $dbname:
    user     => $dbuser,
    password => $dbpass,
  }
}
