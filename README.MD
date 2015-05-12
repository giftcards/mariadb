## Synopsis  
  
Puppet module to setup MariaDB 10 with Galera binaries as well as install some common Percona tools.  
  
## Example  
  
Defaults are stored in params.pp.  
Installs a mysql_server_id fact which can be used to generate a unique server ID on the fly.  
  
## Motivation  
  
Required to replace existing MySQL 5.1, MySQL 5.5, and MariaDB 5.5 installations.  
  
## Installation  
  
Tested on CentOS 6  
Requires MariaDB 10 repository https://downloads.mariadb.org/mariadb/repositories/#mirror=ut-austin  
Requires Percona tools repository http://www.percona.com/doc/percona-server/5.5/installation/yum_repo.html  
  
## API Reference  
  
# All of these users and passwords are set once on installation, they are not reset if changed or not configured at module installation  
passwd => sets the root password on installation, REQUIRED (even if unset)  
secureInstall => runs mysql_secure_install on package installation  
zabbixUser => true/false installs the zabbix monitoring user  
zabbixUserPassword => password for the zabbix user  
zabbixUserName = username for the zabbix user  
  
# All of these options correspond to the matching option in my.cnf  
serverId  
maxAllowedPacket  
datadir  
tmpdir  
logdir  
scratchdir  
socket  
skipNameResolve  
tableOpenCache  
threadCacheSize  
backLog  
maxConnectErrors  
openFilesLimit  
interactiveTimeout  
waitTimeout  
maxConnections  
threadConcurrency  
myisamSortBufferSize  
tmpTableSize  
slowQueryLog  
slowQueryLogFile  
longQueryTime  
logQueriesNotUsingIndexes  
maxHeapTableSize  
queryCacheSize  
queryCacheType  
sortBufferSize  
readBufferSize  
readRndBufferSize  
joinBufferSize  
defaultStorageEngine  
keyBufferSize  
innodbFlushLogAtTrxCommit  
innodbLogFilesInGroup  
innodbLogBufferSize  
innodbAdditionalMemPoolSize  
innodbLockWaitTimeout  
innodbLogFileSize  
innodbBufferPoolSize  
innodbFilePerTable  
innodbThreadConcurrency  
innodbReadIoThreads  
innodbWriteIoThreads  
syncBinlog  
binlogFormat  
logBin  
logBinIndex  
relayLog  
relayLogIndex  
relayLogSpaceLimit  
expireLogsDays  
logSlaveUpdates  
autoIncrementIncrement  
autoIncrementOffset  
characterSetServer  
collationServer  
  
## Contributors  
  
Ryan Munz for Giftcards.com - May 2015  
