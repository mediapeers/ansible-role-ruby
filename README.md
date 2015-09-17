TODO Add build status

# Ansible role ruby

Installs ruby with the help of the [ruby-install](https://github.com/postmodern/ruby-install) tool. Just provide a ruby version
number and this role will take care of the rest.

Does a clean ruby install by downloading and compiling ruby (no rvm/rbenv/chruby busines),
see [ruby-install](https://github.com/postmodern/ruby-install).

Also installs the bundler gem.

## Credits
Based on the two existing ansible roles:
* innohub-ansible.ruby-install - [Github](https://github.com/innohub-ansible/ruby-install), [Galaxy](https://galaxy.ansible.com/list#/roles/1766)
* joshualund.ruby-common - [Github](https://github.com/jlund/ansible-ruby-common), [Galaxy](https://galaxy.ansible.com/list#/roles/143)

## Requirements
Tested ONLY on Ubuntu 14.04 Trusty.

## Role Variables
ruby_version: Version of ruby you want to have installed

Optionally you can also specify the version of the ruby-install script
with `ruby_install_version`.

## Dependencies
None

## Example Playbook
Example Playbook integration:
```yaml
- hosts: servers
  roles:
     { role: mpx.ruby, ruby_version: 2.2.3 }
```
Also works with jruby (or any ruby that [ruby-install supports](https://github.com/postmodern/ruby-install/blob/master/README.md)): `jruby-1.7.21`

## License
MIT
