class profile::db::pgsqlserver (
  $collect_exports = true,
) {
  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    listen_addresses           => '*',
  }

  if $collect_exports {
    Profile::Db::Pgsql::Export <<| |>>
  }
}
