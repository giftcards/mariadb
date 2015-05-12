class mariadb::config
{

  group { 'mysql':
    ensure => present,
    system => true,
    before => Package[$mariadb::packages],
  }

  user { 'mysql':
    ensure => present,
    groups => 'mysql',
    home   => $mariadb::datadir,
    shell  => '/bin/bash',
    system => true,
    before => Package[$mariadb::packages],
  }

  File {
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    notify => Service[$mariadb::services],
    before => Package[$mariadb::packages],
  }


  file {
    '/etc/my.cnf.d':
      ensure => directory;

    '/etc/my.cnf':
      source => 'puppet:///modules/mariadb/my.cnf';

    '/etc/my.cnf.d/mysql-clients.cnf':
      content => template('mariadb/mysql-clients.cnf.erb');

    '/etc/my.cnf.d/server.cnf':
      content => template('mariadb/server.cnf.erb');

    $mariadb::tmpdir:
      ensure => directory,
      owner  => 'mysql',
      group  => 'mysql',
      mode   => '0755';

    $mariadb::logdir:
      ensure => directory,
      owner  => 'mysql',
      group  => 'mysql',
      mode   => '0755';

    $mariadb::scratchdir:
      ensure => directory,
      owner  => 'mysql',
      group  => 'mysql',
      mode   => '0750';
  }

  # Puppet doesn't handle socket files, you actually can't do anything with a directory that has them
  # without horribly bad things happening. 
  file {
    '/var/lib/mysql':
      ensure => directory,
      owner  => 'mysql',
      group  => 'mysql';
  }
}
