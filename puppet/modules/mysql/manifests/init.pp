class mysql {

	package {
		'mysql-server':
			ensure => present,
			require => Exec['apt-get update'],
	}

	service {
		'mysql':
			enable => true,
			ensure => running,
			require => Package['mysql-server'],
	}

	exec {
		'set-mysql-password':
			unless  => 'mysqladmin -uroot -proot status',
			command => 'mysqladmin -uroot password root',
			require => Service['mysql'],
	}
}