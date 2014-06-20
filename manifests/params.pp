class ssh::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04)/ : {
          $package        = 'ssh'
          $service        = 'ssh'
          $ssh_config     = '/etc/ssh/ssh_config'
          $sshd_config    = '/etc/ssh/sshd_config'
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
