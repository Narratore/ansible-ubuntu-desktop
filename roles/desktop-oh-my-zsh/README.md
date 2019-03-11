destkop-oh-my-zsh
================

Tasks for setting up oh my zsh.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

* oh_my_zsh_repo: https://github.com/robbyrussell/oh-my-zsh
* oh_my_zsh_dir: ~/.oh-my-zsh
* oh_my_zsh_users:
  - "{{ ansible_ssh_user }}"
* oh_my_zsh_rc: ~/.zshrc

Dependencies
------------

Not at the moment.

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - desktop-oh-my-zsh

License
-------

MIT

Author Information
------------------

Please any question, please contact the autor at: jorge.medina@kronops.com.mx.
