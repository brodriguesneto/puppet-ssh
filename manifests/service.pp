class ssh::service {
  service { $ssh::params::service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['ssh::config'],
  }
}
