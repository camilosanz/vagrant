# -*- mode: ruby -*-
# vi: set ft=ruby :
RUNNER_URL = "https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz"
GITHUB_URL = "https://github.com/devops-bc-01/camilo_villalba"
# GITHUB_URL_TEST = "https://github.com/camilosanz/vagrant"
GITHUB_HASH = "34a8f34956cdacd2156d4c658cce8dd54c5aef316a16bbbc95eb3ca4fd76429a"
# GITHUB_HASH_TEST = "34a8f34956cdacd2156d4c658cce8dd54c5aef316a16bbbc95eb3ca4fd76429a"
RUNNER_NAME = "camilo.villalba.runner"
RUNNER_DIR = "actions-runner"
RUNNER_VERSION = "linux-x64-2.296.2.tar.gz"
RUNNER_SERVICE = "actions.runner.devops-bc-01-camilo_villalba.camilo.villalba.runner.service"
# RUNNER_SERVICE_TEST = "actions.runner.vagrant.camilo.villalba.runner.service"
# REPO_NAME = "camilo_villalba"
# REPO_NAME_TEST = "vagrant"
# GIT_REMOTE = "git@github.com:camilosanz/vagrant.git"
# GIT_REMOTE_TEST = "git@github.com:camilosanz/vagrant.git"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.env.enable
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.ssh.insert_key = false
  # config.vm.provider :virtualbox do |v|
  #   v.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
  #   v.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
  # end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
  end
  
  config.vm.provision "shell" do |s|
    s.path = "myscript.sh"
    s.args = [
      RUNNER_URL, 
      GITHUB_URL, 
      ENV['GITHUB_TOKEN_TEST'], 
      RUNNER_NAME, 
      RUNNER_DIR, 
      RUNNER_VERSION, 
      GITHUB_HASH, 
      RUNNER_SERVICE,
      REPO_NAME,
      GIT_REMOTE
    ] 
    s.privileged = false
  end

end