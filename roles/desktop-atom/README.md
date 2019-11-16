desktop-atom
============

Deploy atom on ubuntu desktop.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

atom_url_deb: "https://atom.io/download/deb"
atom_tmp_deb: "/tmp/atom.deb"

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - desktop-atom

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
