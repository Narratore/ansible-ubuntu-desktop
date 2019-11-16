desktop-zoom
============

Deploy zoom on ubuntu desktop.

Requirements
------------

Ubuntu based system.

Role Variables
--------------

These are default variables for this role:

zoom:
  dependencies:
    - libglib2.0-0
    - libxcb-shape0
    - libxcb-shm0
    - libxcb-xfixes0
    - libxcb-randr0
    - libxcb-image0
    - libfontconfig1
    - libgl1-mesa-glx
    - libegl1-mesa
    - libxi6
    - libsm6
    - libxrender1
    - libpulse0
    - libxcomposite1
    - libxslt1.1
    - libsqlite3-0
    - libxcb-keysyms1
    - libxcb-xtest0
    - libdbus-1-3
    - libgstreamer-plugins-base1.0-0
    - dconf-cli
    - gir1.2-ibus-1.0
    - ibus

Dependencies
------------

Example Playbook
----------------

To use this role, just include it in your playbook, for example:

    - hosts: desktop
      roles:
         - desktop-zoom

License
-------

MIT

Author Information
------------------

Please any question, please contact the author at: jorge.medina@kronops.com.mx.
