class mariadb::params {

  # Changing anything in this file will change the setting in all nodes that use this module!

  $secureInstall = true
  $zabbixUser = true
  $zabbixUserPassword = 'zabbixuserpassword'
  $zabbixUserName = 'zabbixuser'
  $version = '10'
  $serverId = $::mysql_server_id
  $maxAllowedPacket = '512M'
  $datadir = '/local/mysql'
  $tmpdir = '/local/mysqltmp'
  $logdir = '/local/mysqllogs'
  $scratchdir = '/local/mysqlscratch'
  $socket = '/local/mysql/mysql.sock'
  $skipNameResolve = '1'
  $backLog = '100'
  $maxConnectErrors = '10000'
  $openFilesLimit = '20000'
  $interactiveTimeout = '3600'
  $waitTimeout = '900'
  $tableOpenCache = '512'
  $threadCacheSize = '128'
  $threadConcurrency = '8'
  $myisamSortBufferSize = '64M'
  $maxConnections = '80'
  $slowQueryLog = '1'
  $slowQueryLogFile = '/local/mysqllogs/mysql-slow-log'
  $longQueryTime = '2'
  $logQueriesNotUsingIndexes = '1'
  $tmpTableSize = '256M'
  $maxHeapTableSize = '200M'
  $queryCacheSize = '16M'
  $queryCacheType = '1'
  $sortBufferSize = '8M'
  $readBufferSize = '8M'
  $readRndBufferSize = '8M'
  $joinBufferSize = '1M'
  $defaultStorageEngine = 'InnoDB'
  $keyBufferSize = '8M'
  $innodbFlushLogAtTrxCommit = '1'
  $innodbLogFilesInGroup = '4'
  $innodbLogBufferSize = '8M'
  $innodbAdditionalMemPoolSize = '20M'
  $innodbLockWaitTimeout = '50'
  $innodbLogFileSize = '512M'
  $innodbBufferPoolSize = '512M'
  $innodbFilePerTable = '1'
  $innodbThreadConcurrency = '16'
  $innodbReadIoThreads = '8'
  $innodbWriteIoThreads = '8'
  $syncBinlog=1
  $binlogFormat='ROW'
  $logBin = '/local/mysqllogs/mysql-bin-log'
  $logBinIndex = '/local/mysqllogs/mysql-bin-log.index'
  $relayLog = '/local/mysqllogs/mysql-relay-log'
  $relayLogIndex = '/local/mysqllogs/mysql-relay-log.index'
  $relayLogSpaceLimit = '16G'
  $expireLogsDays = '4'
  $logSlaveUpdates = '1'
  $autoIncrementIncrement = '1'
  $autoIncrementOffset = '1'
  $characterSetServer = 'utf8'
  $collationServer = 'utf8_unicode_ci'
  $packages = [ 'MariaDB-Galera-server', 'MariaDB-client', 'socat', 'percona-xtrabackup' ]
  $nopackages = [ 'MariaDB-server', 'percona-xtrabackup-21' ]
  $services = [ 'mysql' ]
}