# Class: ssh
class ssh ($ensure = 'present', $autoupgrade = false,) inherits ssh::params {
  case $ensure {
    /(present)/ : {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/  : {
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include ssh::install, ssh::config, ssh::service
  Class['ssh::install'] -> Class['ssh::config'] ~> Class['ssh::service']
}
