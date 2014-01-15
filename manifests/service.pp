# == Class: gor::service
#
# Private class. Should not be called directly.
#
class gor::service {
  $service_ensure = $::gor::service_ensure
  $service_enable = $service_ensure ? {
    stopped => false,
    false   => false,
    default => true,
  }

  service { 'gor':
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
