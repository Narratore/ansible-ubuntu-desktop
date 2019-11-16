desktop-vagrant
===============

Deploy vagrant on ubuntu desktop.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

vagrant_version: "2.1.0"
vagrant_tmp_dir: "/tmp/downloads/"
vagrant_deb_tmp: "{{ vagrant_tmp_dir }}/vagrant_{{ vagrant_version }}.deb"

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - desktop-vagrant

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
