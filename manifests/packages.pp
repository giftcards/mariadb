class mariadb::packages {
  package { $mariadb::nopackages: ensure => absent, }
  package { $mariadb::packages: ensure => installed, }
}
