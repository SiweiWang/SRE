# Ansible to manage server config

## testing ansible changes

1. start a local virtualbox using vagrant `vagrant up <vm_name>`

1. log into vm, each vm has ansible pre-installed.

1. run ansible from /vagrant dir, for example `ansible-playbook local.yml -l prometheus` to use ansible to provision premetheus server
