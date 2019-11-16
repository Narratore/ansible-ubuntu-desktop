desktop-google-chrome
=====================

Deploy google-chrome on ubuntu desktop.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

chrome_apt_file: /etc/apt/sources.list.d/google-chrome.list
talkplugin_apt_file: /etc/apt/sources.list.d/google-talkplugin.list

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - desktop-google-chrome

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
