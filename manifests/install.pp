class ssh::install {
  package { $ssh::params::package:
    ensure => $ssh::package_ensure,
  }
}
