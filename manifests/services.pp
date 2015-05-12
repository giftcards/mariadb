class mariadb::services
{

  if ($mariadb::services) {
    service {$mariadb::services:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      require    => Package[$mariadb::packages],
    }
  }
  # This sets up our zabbix agent monitoring user
  if $mariadb::zabbixUser == true {
    exec { 'zabbix-user':
      require => Service[$mariadb::services],
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      # This will only work on initial install, I don't want it to trigger on every package change
      onlyif  => "mysqladmin --no-defaults --socket=${mariadb::socket} -u root status",
      before  => Exec['mysql-secure'],
      command => "echo \"GRANT USAGE ON *.* TO '${zabbixUserName}'@'localhost' IDENTIFIED BY '${mariadb::zabbixUserPassword}'\" | mysql",
    }
  }

  # Is only run if the mysql server doesn't have a password and secureInstall is true.
  if $mariadb::secureInstall == true {
    exec { 'mysql-secure':
      require => Service[$mariadb::services],
      path    => '/bin:/usr/bin',
      # Only set password if no password is set.
      onlyif  => "mysqladmin --no-defaults --socket=${mariadb::socket} -u root status",
      command => "echo \"UPDATE mysql.user SET Password=PASSWORD(\'${mariadb::passwd}\') WHERE User=\'root\'; FLUSH PRIVILEGES; DELETE FROM mysql.user WHERE User=\'\'; DELETE FROM mysql.user WHERE User=\'root\' AND Host NOT IN (\'localhost\', \'127.0.0.1\', \'::1\'); DROP DATABASE test; DELETE FROM mysql.db WHERE Db=\'test\' OR Db=\'test\\_%\'; FLUSH PRIVILEGES;\" | mysql",
    }
  }
}
