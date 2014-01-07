# == Class: gor::package
#
# Private class. Should not be called directly.
#
class gor::package {
  $package_ensure = $::gor::package_ensure

  package { 'gor':
    ensure => $package_ensure,
  }
}
