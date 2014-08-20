#


class trigger::config inherits trigger::params {

  group { 'trigger':
    ensure  => present,
    gid     => 1000,
    }

  user { 'trigger':
    ensure      => present,
    managehome  => true,
    gid         => 'trigger',
    require     => Group['trigger'],
    }

  file { '/etc/trigger':
    ensure  => 'directory',
    owner   => 'trigger',
    group   => 'trigger',
    mode    => 750,
    }

  file { '/etc/trigger/trigger_settings.py':
    path    => '/etc/trigger/trigger_settings.py',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => [ Package['trigger'], File['/etc/trigger'] ]
    content => template('trigger_settings.py.erb'),
    }


}

