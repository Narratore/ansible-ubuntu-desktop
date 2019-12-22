packer-service
==============

This role installs Packer for building fundamental images.

Requirements
------------

This role requires a kvm linux server for building images.

Role Variables
--------------

Defaults:

packer_version: 1.2.5
packer_sha256sum: bc58aa3f3db380b76776e35f69662b49f3cf15cf80420fc81a15ce971430824c
packer_jenkins_username: jenkins
packer_jenkins_groupname: jenkins
packer_staging_path: /kvm/staging
packer_isos_path: /kvm/isos

Other vars:

packer_url: https://releases.hashicorp.com/packer/{{ packer_version }}/packer_{{ packer_version }}_linux_amd64.zip
packer_download_dir: /tmp
packer_install_dir: /usr/local/sbin

Dependencies
------------

This role depends that the host is already deployed following roles:

 * kvm-service

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: servers
      roles:
         - packer-service

License
-------

MIT

Author Information
------------------

Please any question, please contact the autor at: jorge.medina@kronops.com.mx.
