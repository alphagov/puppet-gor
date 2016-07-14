# == Class: gor::config
#
# Private class. Should not be called directly.
#
class gor::config {
  $args = $::gor::args
  $envvars = $::gor::envvars
  $binary_path = $::gor::binary_path

  file { '/etc/init/gor.conf':
    content => template('gor/etc/init/gor.conf.erb'),
  }
}
