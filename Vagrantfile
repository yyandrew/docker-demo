Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provision 'ansible_local' do |ansible|
    ansible.pip_install_cmd = "curl https://bootstrap.pypa.io/get-pip.py | sudo python"
    ansible.install_mode = 'pip'
    # ansible.verbose = true
    ansible.playbook = 'sprovision/playbook.yml'
  end
end
