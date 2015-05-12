class mariadb (

  $passwd,
  $secureInstall = $mariadb::params::secureInstall,
  $zabbixUser = $mariadb::params::zabbixUser,
  $zabbixUserPassword = $mariadb::params::zabbixUserPassword,
  $zabbixUserName = $mariadb::params::zabbixUserName,
  $version = $mariadb::params::version,
  $serverId = $mariadb::params::serverId,
  $maxAllowedPacket = $mariadb::params::maxAllowedPacket,
  $datadir = $mariadb::params::datadir,
  $tmpdir = $mariadb::params::tmpdir,
  $logdir = $mariadb::params::logdir,
  $scratchdir = $mariadb::params::scratchdir,
  $socket = $mariadb::params::socket,
  $skipNameResolve = $mariadb::params::skipNameResolve,
  $tableOpenCache = $mariadb::params::tableOpenCache,
  $threadCacheSize = $mariadb::params::threadCacheSize,
  $backLog = $mariadb::params::backLog,
  $maxConnectErrors = $mariadb::params::maxConnectErrors,
  $openFilesLimit = $mariadb::params::openFilesLimit,
  $interactiveTimeout = $mariadb::params::interactiveTimeout,
  $waitTimeout = $mariadb::params::waitTimeout,
  $maxConnections = $mariadb::params::maxConnections,
  $threadConcurrency = $mariadb::params::threadConcurrency,
  $myisamSortBufferSize = $mariadb::params::myisamSortBufferSize,
  $tmpTableSize = $mariadb::params::tmpTableSize,
  $slowQueryLog = $mariadb::params::slowQueryLog,
  $slowQueryLogFile = $mariadb::params::slowQueryLogFile,
  $longQueryTime = $mariadb::params::longQueryTime,
  $logQueriesNotUsingIndexes = $mariadb::params::logQueriesNotUsingIndexes,
  $maxHeapTableSize = $mariadb::params::maxHeapTableSize,
  $queryCacheSize = $mariadb::params::queryCacheSize,
  $queryCacheType = $mariadb::params::queryCacheType,
  $sortBufferSize = $mariadb::params::sortBufferSize,
  $readBufferSize = $mariadb::params::readBufferSize,
  $readRndBufferSize = $mariadb::params::readRndBufferSize,
  $joinBufferSize = $mariadb::params::joinBufferSize,
  $defaultStorageEngine = $mariadb::params::defaultStorageEngine,
  $keyBufferSize = $mariadb::params::keyBufferSize,
  $innodbFlushLogAtTrxCommit = $mariadb::params::innodbFlushLogAtTrxCommit,
  $innodbLogFilesInGroup = $mariadb::params::innodbLogFilesInGroup,
  $innodbLogBufferSize = $mariadb::params::innodbLogBufferSize,
  $innodbAdditionalMemPoolSize = $mariadb::params::innodbAdditionalMemPoolSize,
  $innodbLockWaitTimeout = $mariadb::params::innodbLockWaitTimeout,
  $innodbLogFileSize = $mariadb::params::innodbLogFileSize,
  $innodbBufferPoolSize = $mariadb::params::innodbBufferPoolSize,
  $innodbFilePerTable = $mariadb::params::innodbFilePerTable,
  $innodbThreadConcurrency = $mariadb::params::innodbThreadConcurrency,
  $innodbReadIoThreads = $mariadb::params::innodbReadIoThreads,
  $innodbWriteIoThreads = $mariadb::params::innodbWriteIoThreads,
  $syncBinlog = $mariadb::params::syncBinlog,
  $binlogFormat = $mariadb::params::binlogFormat,
  $logBin = $mariadb::params::logBin,
  $logBinIndex = $mariadb::params::logBinIndex,
  $relayLog = $mariadb::params::relayLog,
  $relayLogIndex = $mariadb::params::relayLogIndex,
  $relayLogSpaceLimit = $mariadb::params::relayLogSpaceLimit,
  $expireLogsDays = $mariadb::params::expireLogsDays,
  $logSlaveUpdates = $mariadb::params::logSlaveUpdates,
  $autoIncrementIncrement = $mariadb::params::autoIncrementIncrement,
  $autoIncrementOffset = $mariadb::params::autoIncrementOffset,
  $characterSetServer = $mariadb::params::characterSetServer,
  $collationServer = $mariadb::params::collationServer,

) inherits mariadb::params {

  $packages = $mariadb::params::packages
  $nopackages = $mariadb::params::nopackages
  $services = $mariadb::params::services

  # The dependency tree does file and folder configuration first to make sure that when the
  # Maria packages install they use the correct data locations and populate the base data
  # files properly
  include mariadb::config
  include mariadb::packages
  include mariadb::services

}
