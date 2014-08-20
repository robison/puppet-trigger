# Define: trigger::install
#

define trigger::install (
  $onlyif=undef,
  ) inherits trigger::params {

  package { 'trigger':
    ensure      => installed,
    provider    => 'pip',
  }
}
