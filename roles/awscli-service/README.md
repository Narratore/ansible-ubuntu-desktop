awscli-service
==============

Tasks for setting up aws cli via pip.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

aws_cli_user: jenkins
aws_cli_group: jenkins
aws_cli_user_home: /var/lib/jenkins
aws_output_format: 'json'
aws_region: 'us-west-2'
aws_access_key_id: 'YOUR_ACCESS_KEY_ID'
aws_secret_access_key: 'YOUR_SECRET_ACCESS_KEY'


Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: servers
      roles:
         - awscli-service

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
