Vagrant.configure('2') do |config|

	config.vm.box = 'precise-server-i386'
	config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box'

	config.vm.network :forwarded_port, guest: 80, host: 8080

	config.vm.synced_folder './', '/vagrant'

	config.vm.provider :virtualbox do |vb|
		vb.gui = false
		vb.customize ['modifyvm', :id, '--memory', '1024']
		vb.customize ['modifyvm', :id, '--cpus', '1']
	end

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = 'puppet/manifests'
		puppet.manifest_file = 'dev-server.pp'
		puppet.module_path = 'puppet/modules'
		puppet.options = '--verbose'
	end

end