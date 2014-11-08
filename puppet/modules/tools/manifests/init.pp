class tools {

	$packages = [
		'curl',
		'nodejs'
	]

	package {
		$packages:
			ensure  => present,
			require => Exec['apt-get update'],
	}

	$location = '/vagrant/www'

	exec {
		'get composer':
			command => '/usr/bin/curl -sSL https://getcomposer.org/installer | /usr/bin/php',
			cwd     => '/tmp/',
			require => Package['curl', 'php5-json'],
			creates => '/tmp/composer.phar';

		'get adminer':
			command => "/usr/bin/curl -sSL http://www.adminer.org/latest.php -o /vagrant/www/admin.php",
			require => File[$location],
			creates => "${location}/admin.php",
			returns => [0, 4],
	}

	file {
		'/usr/bin/composer':
			ensure  => present,
			source  => '/tmp/composer.phar',
			require => Exec['get composer'],
	}
}