class apache {

	package {
		'apache2':
			ensure => present,
			require => Exec['apt-get update'],
	}

	service {
		'apache2':
			ensure => running,
			require => Package['apache2'],
	}

	file {
		'/vagrant/www':
			ensure  => directory,
			require => Package['apache2'];

		'/etc/apache2/httpd.conf':
			source  => 'puppet:///modules/apache/httpd.conf',
			require => Package['apache2'],
			notify  => Service['apache2'],
	}
}