class php {

	$packages = [
		'php5',
		'libapache2-mod-php5',
		'php5-cli',
		'php5-mysql',
		'php5-curl',
		'php5-common',
		'php5-imap',
		'php5-json',
		'php5-gd',
		'php5-mcrypt'
	]

	package {
		$packages:
			ensure => present,
			require => Exec['apt-get update'],
	}

	file {
		'/vagrant/www/index.php':
			replace => 'no',
			ensure => present,
			content => '<?php phpinfo(); ?>',
			require => Package['apache2'],
	}
}