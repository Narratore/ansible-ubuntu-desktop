common
======

Setup common operating system tasks.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

locale: en_US.UTF-8
timezone: America/Mexico_City
hostname_fqdn: "{{ansible_fqdn}}"
hostname_name: "{{hostname_fqdn.split('.').0}}"

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - common

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
