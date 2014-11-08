Exec {
	path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

class {
	'init':
		gitUser => 'Dev User',
		gitEmail => 'dev@example.com',
}