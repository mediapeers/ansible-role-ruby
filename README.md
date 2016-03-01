[![Build Status](https://travis-ci.org/mediapeers/ansible-role-ruby.svg?branch=master)](https://travis-ci.org/mediapeers/ansible-role-ruby)

# Ansible role ruby

Installs ruby with the help of the [ruby-install](https://github.com/postmodern/ruby-install) tool. Just provide a ruby version
number (and optionally the ruby edition, see below) and this role will take care of the rest.

Does a clean ruby install by downloading and compiling ruby (no rvm/rbenv/chruby/package repo business),
see [ruby-install](https://github.com/postmodern/ruby-install). Once installed the ruby version is linked from `/usr/local/bin`
to make it the system wide default version. So this role is most practical for server installation where you don't have the
need to juggle multiple ruby versions on the same machine.

This role also installs the bundler gem for you. So you are ready to go right away!

## Credits
Based on the two existing ansible roles:
* innohub-ansible.ruby-install - [Github](https://github.com/innohub-ansible/ruby-install), [Galaxy](https://galaxy.ansible.com/list#/roles/1766)
* joshualund.ruby-common - [Github](https://github.com/jlund/ansible-ruby-common), [Galaxy](https://galaxy.ansible.com/list#/roles/143)

## Requirements
Tested only on Ubuntu 14.04 Trusty Server. Supports only Ubuntu and perhaps Debian based systems (apt).

## Role Variables
* ruby_version_string: Edition and version of ruby you want to have installed. Default to ruby (MRI) 2.2.3.
So you can either just do a version like `2.2.1` if you want just standard (MRI) ruby. Or prepend the version with a edition.
For example `jruby-1.7`

Optionally you can also specify the version of the ruby-install script
with `ruby_install_version`.

See more (less relevant) variables you can modify in `defaults/main.yml`.

## Dependencies
Needs no other Ansible roles to run.

## Example Playbook
Example Playbook integration:
```yaml
- hosts: servers
  roles:
     { role: mpx.ruby, ruby_version_string: 2.2.3 }
```
Also works with jruby (or any ruby that [ruby-install supports](https://github.com/postmodern/ruby-install/blob/master/README.md)).
Example: `ruby_version_string: jruby-1.7.21`. So the version directive works like the one found in [`.ruby-version` files](https://gist.github.com/fnichol/1912050).

## License
MIT License. As I based my work on above metioned projects. See LICENSE file for full text.
