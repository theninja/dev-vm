class git($gitUser, $gitEmail) {

	package {
		'git':
			ensure => latest,
			require => Exec['apt-get update'],
	}

	file {
		'/home/vagrant/.gitconfig':
			ensure => file,
			replace => false,
			source => 'puppet:///modules/git/.gitconfig',
	}

	exec {
		'set git username':
			command => "sed -i 's/name = {GITNAME}/name = $gitUser/' /home/vagrant/.gitconfig",
			onlyif => 'grep "name = {GITNAME}" /home/vagrant/.gitconfig',
			require => File['/home/vagrant/.gitconfig'],
	}
	exec {
		'set git email':
			command => "sed -i 's/email = {GITEMAIL}/email = $gitEmail/' /home/vagrant/.gitconfig",
			onlyif => 'grep "email = {GITEMAIL}" /home/vagrant/.gitconfig',
			require => File['/home/vagrant/.gitconfig'],
	}
}