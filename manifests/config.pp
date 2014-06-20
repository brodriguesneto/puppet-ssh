class ssh::config {
  file { $ssh::params::sshd_config:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/sshd_config.erb"),
    require => Package[$ssh::params::package],
    notify  => Service[$ssh::params::service],
  }

  file { $ssh::params::ssh_config:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/ssh_config.erb"),
    require => Package[$ssh::params::package],
  }
}
