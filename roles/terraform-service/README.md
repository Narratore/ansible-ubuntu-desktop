terraform-service
=================

Tasks for setting up terraform

Requirements
------------

Ubuntu based system.

Role Variables
--------------

terraform_version: 0.12.13
terraform_url: https://releases.hashicorp.com/terraform/{{ terraform_version }}/terraform_{{ terraform_version }}_linux_amd64.zip


Dependencies
------------

Not at the moment.

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: servers
      roles:
        - terraform-service

License
-------

MIT

Author Information
------------------

Please any question, please contact the autor at: axel.herrera@kronops.com.mx.
