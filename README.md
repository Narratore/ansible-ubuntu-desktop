# Ansible for my personal Kubuntu Desktop

## Introduction

I use Linux as the base operating system on my personal computers at home and work,
I don't like to do repetitive work, I prefer to automate it, one work that I'd like
to automate is the setup process after installing the base operating system on my
laptops, I call this, the post-setup process, the requisite to automate something
is document it, so I wrote a guide which helps me to do this process manually, with
a script, or with a configuration management tool like Ansible.

This repository contains documentation and ansible playbooks to automatically install
all the programs I use at work and home. Most programs I use are open source, they
are included in the official repositories of Ubuntu, in this case for Ubuntu 18.04
(bionic), I also requiere other programs wich are not open source, at least they are
freely available.

### Objetives

The main objetive is to automatically execute the tasks in the post-setup process,
personally I run this tasks every time after installing the operating system:

 * Customize bash shell enviroment
 * Install official packages by group
   * Configuring apt repositories
   * Configuring apt PPA repositories
   * Configure http proxy for apt tools
   * Install shell tools
   * Install toos for DocBook technical documentation
   * Install security tools for shell and X11
   * Install development tools
   * Install office and image tools
   * Install extra packages for KDE
   * Install audio and video packages
   * Install personal productivity tools
   * Install KVM and libvirt virtualization tools
 * Install third party tools
   * Install google chrome packages and plugins for hangouts
   * Install NX client and server
   * Install VirtualBox
   * Install Vagrant
   * Install Skype
   * Install Teamviewer
   * Install Insync
   * Install Fprint fingerprint support

## Cloning the repository

First we need to go the directory we are going to work, and clone the repository
from github, for example:

```
$ mkdir ~/data/vcs
$ cd ~/data/vcs
$ git clone https://github.com/jorgearma1982/ansible-my-kubuntu-desktop.git
$ cd ansible-my-kubuntu-desktop
```

## Installing and Testing Ansible

In order to install ansible, you need to run bin/install-ansible-on-ubuntu.sh,
for example:

```
$ sudo bin/install-ansible-on-ubuntu.sh
```

This scripts tests localhost connection at the end.

## Validating local conection

Now run ansible with local connection to localhost.

```
$ ansible 127.0.0.1 -c local -m ping
```

Go to next section to run playbooks.

## The playbook

The main playbook is localsystem.yml, let's display it:

```
$ cat localsystem.yml
---
#
# Playbook: Local System
#

- hosts: localhost
  connection: local
  user: changeme
  become: yes

# Pre-Tasks

  pre_tasks:

  - name: Pretask | Running pre tasks routine
    shell: echo 'I":" Beginning to configure the system...'

  - name: Pretask | Update apt cache
    apt: update_cache=yes

  roles:
    - common
    - package-mgmt
    - shell-settings
    - shell-tools
#    - local-storage
#    - desktop-kit
#    - desktop-virtualbox
#    - desktop-vagrant
#    - desktop-insync
#    - desktop-teamviewer
#    - desktop-skype
#    - desktop-google-chrome
#    - desktop-fingerprint
#    - desktop-flux
```

## Running the Ansible playbook

Before you run ansible, plase edit localsystem.yml playbook file, change the
variable 'user' with your own username, for example:

```
$ sed -i 's/changeme/jmedina/' localsystem.yml
```
So, it looks like this:

```
- hosts: localhost
  connection: local
  user: jmedina
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local
user jmedina and use sudo to gain privileges, note that 'become' replaces the
old 'sudo' parameter.

## Running only a group of tasks using tags

If you remember, in the main playbook localsystem.yml we use roles to group
task associated to a program, I have tagged every task in the different playbooks
for each role, so if you want to run only  the task asociated to a rol, use the
'--tags' with a comma separaed list of tags.

Each role includes more that one task, some of the are grouped, task on a role
can include more than one tag, here are the main tags:

 * common: system_settings
 * common: system_settings_timezone
 * package-mgmt: purge_package_mgmt
 * package-mgmt: reposetup_package_mgmt
 * shell-settings: shell_settings
 * shell-tools: shell_tools
 * local-storage: desktop_local_storage
 * desktop-kit: desktop_kit_shell
 * desktop-kit: desktop_kit_techdoc
 * desktop-kit: desktop_kit_security
 * desktop-kit: desktop_kit_development
 * desktop-kit: desktop_kit_imageedit
 * desktop-kit: desktop_kit_web_im_mail
 * desktop-kit: desktop_kit_remoteadmin
 * desktop-kit: desktop_kit_audiovideo
 * desktop-kit: desktop_kit_productivity
 * desktop-kit: desktop_kit_libvirt_desk
 * desktop-kit: desktop_kit_sshvpn
 * desktop-virtualbox: desktop_virtualbox
 * desktop-vagrant: desktop_vagrant
 * desktop-teamviewer: desktop_teamviewer
 * desktop-skype: desktop_skype
 * desktop-insync: desktop_insync
 * desktop-google-chrome: desktop_insync
 * desktop-fingerprint: desktop_fingerprint
 * desktop-flux: desktop_flux

IMPORTANT: Be careful when you run tasks from the desktop-kit role, there are some
heavy apps you may not need.

Now run ansible with a few simple tasks for system settings:

```
$ ansible-playbook localsystem.yml -K --tags=system_settings,system_settings_timezone
```

'NOTE:' Here we use '-K' parameter so ansible asks for user password to run tasks with privileges.

Let's run the tasks for the package management, shell settings and tools:

```
$ ansible-playbook localsystem.yml -K --tags=clean_package_mgmt,purge_package_mgmt,reposetup_package_mgmt,shell_settings,shell_tools
```

Now, lets run some tasks for more advanced desktop requirements:

```
$ ansible-playbook localsystem.yml -K --tags=desktop_kit_shell,desktop_kit_security,desktop_kit_development,desktop_kit_imageedit,desktop_kit_audiovideo,desktop_kit_productivity,desktop_kit_libvirt_desk,desktop_kit_sshvpn
```

I use different tools for my local storage:

```
$ ansible-playbook localsystem.yml -K --tags=desktop_local_storage
```

Let's run some tasks for local development:

```
$ ansible-playbook localsystem.yml -K --tags=desktop_virtualbox,desktop_vagrant
```

## Creating new roles

If you want to group lots of tasks with a different purpose, I recommend you to create a dedicated playbook inside a role, you can create a role using the command ansible-galaxy, for example:

First, go inside your main directory on your proyect, we expect a roles directory on the root.

```
$ cd roles

$ ansible-galaxy init desktop-insync

$ tree desktop-insync/
desktop-insync/
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── README.md
├── tasks
│   └── main.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml

8 directories, 8 files

```

Ansible galaxy will create the role files and directories structure, most of the work is on the tasks directory, inside the main.yml file.

```
$ vim roles/desktop-insync/tasks/main.yml
```

Before you can run the tasks on this new role, you have to incluide it on the main playbook, that is localsystem.yml, for example:

```
$ vim localsystem.yml
---

...
...
...

  roles:
    - common
    - package-mgmt
    - shell-settings
    - shell-tools
    - local-storage
    - desktop-kit
    - desktop-virtualbox
    - desktop-vagrant
    - desktop-insync
#    - desktop-teamviewer
#    - desktop-skype
#    - desktop-google-chrome
#    - desktop-fingerprint
```
That is, if you want to clone this repository go ahead, please give feed back if you want to help to improve this.

## Mejores prácticas

Para el caso de una PC con Ansible, solo es necesario un playbook principal que puede ser localsystem.yml el cual incluye uno o varios roles con diferentes tareas.

Para construir la estructura del rol se debe usar ansible-galaxy, el nombre debe ser rol-service.

IMPORTANTE: Los roles deben usar guión medio para separar las palabras que componen el nombre del  rol, se aconseja que los nombres de los roles terminen con "-service".

Se deben seguir las mejores prácticas de edición en relación a :

 * Escribir nombres de tareas descriptivas y en inglés.
 * Identado basado en espacios en blanco.
 * Lineas en blanco para separar cada tarea
 * Uso de variables en formato ansible 2.x, ejemplo ansible_ssh_host en lugar de ansible_host.
 * Uso de variables especificas para el componente en vars/main.yml.
 * Uso de variables especificas para el ambiente en defaults/main.yml.
 * Uso de variables especificas para el centro en inventory/marca/production.
 * Uso de variables estandar en base a el inventario o facts para evitar re escribir funciones de shell para capturar datos.
 * Se deben usar las funciones de python como split para sacar variables personalizadas siempre en base a variables exitentes en inventario, rol o fact.
 * Se deben usar tags para cada tarea, si son generales que se use la etiqueta general rol_service, note el guion bajo, no se usan guión medio "-".

Una vez desarrollado el playbook del rol, se debe agregar el rol al playbook de cada tipo de servidor abajo del rol de snmp-service.

Se deben documentar los tags en el documento de la matriz del sistema de gestión de configuraciones que se adjunta.

Los cambios deben integrarse al repositorio git ansible en la rama development y realizar un merge request para que se valide.

## Contributing

Si desea contribuir al código se recomienda clonar el repositorio y trabajar en un feature branch o en development y hacer pull request para integrar a la rama master del ambiente de production.

La rama master está protegida para que solo usuarios con rol de owner o master puedan hacer commits, la forma más segura de integrar cambios es hacer pull request y peer review del código, para validarlo y probarlo en el ambiente de pruebas antes de poder integrar el código al ambiente productivo.
