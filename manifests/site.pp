File { backup => false }

Package {
  allow_virtual => true,
}

node default {
  #  if !empty( $trusted['extensions']['pp_role'] ) {
  #  include "role::${trusted['extensions']['pp_role']}"
  #}
}
