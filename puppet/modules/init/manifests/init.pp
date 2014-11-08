class init($gitUser, $gitEmail) {

	group {
		'puppet':
			ensure => 'present',
	}

	exec {
		'apt-get update':
			command => '/usr/bin/apt-get update',
	}

	include apache, mysql, php

	class {
		'git':
			gitUser => $gitUser,
			gitEmail => $gitEmail,
	}

	include tools
}