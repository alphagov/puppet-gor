# == Class: gor::service
#
# Private class. Should not be called directly.
#
class gor::service {
  service { 'gor':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
