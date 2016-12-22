# Ansible for my personal Kubuntu Desktop

## Introduction

I use Linux as the base operating system on my personal computers at home and work, I don't like to do repetitive work, I prefer to automate it, one work that I'd like to automate is the setup process after installing the base operating system on my laptops, I call this, the post-setup process, the requisite to automate something is document it, so I wrote a guide which helps me to do this process manually, with a script, or with a configuration management tool like Ansible.

This repository contains documentation and ansible playbooks to automatically install all the programs I use at work and home. Most programs I use are open source, they are included in the official repositories of Ubuntu, in this case for Ubuntu 16.04 (xenial), I also requiere other programs wich are not open source, at least they are freely available.

### Objetives

The main objetive is to automatically execute the tasks in the post-setup process, personally I run this tasks every time after installing the operating system:

 * Personalizar la configuración del entorno del shell bash
 * Instalación de grupos de paquetes oficiales
   * Configuración de los depósitos de paquetes oficiales de Kubuntu.
   * Configuración de los depósitos de paquetes PPA para Kubuntu.
   * Configuración de proxy HTTP en herramientas basadas en APT.
   * Instalación de programas para trabajo en la consola o shell.
   * Instalación de paquetes para documentación técnica con Docbook
   * Instalación de herramientas de seguridad para el shell y X11
   * Instalación de Herramientas para Desarrollo
   * Instalación de Herramientas para oficina y edición de imágenes
   * Instalación de paquetes para extras para KDE
   * Instalación de paquetes para Audio y Video
   * Instalación de herramientas de productividad
   * Instalación de sistema de virtualización KVM con virt-manager
 * Instalación de herramientas de terceros
   * Instalar e navegador Google Chrome y plugin para Google hangouts
   * Instalación del cliente y servidor NX
   * Instalación de VirtualBox
   * Instalación de Skype
   * Instalación de Teamviewer
   * Instalación de Insync
   * Fingerprint/fprint installation.
   * Vagrant installation.

## Cloning the repository

We go the directory we are going to work:

```
$ cd ~/data/vcs/tuxjm
$ git clone https://github.com/jorgearma1982/ansible-my-kubuntu-desktop.git
$ cd ansible-my-kubuntu-desktop
```

## Installing and Testing Ansible

Para instalar ansible en el sistema local ubuntu ejecute el script bin/install-ansible-on-ubuntu.sh

```
$ sudo bin/install-ansible-on-ubuntu.sh
```

## Validating local conection

Valide que ansible se puede conectar al host local.

```
$ ansible 127.0.0.1 -c local -m ping
```

Continue la siguiente seccion para ejecutar los playbooks.

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

#  vars_files:
#    - group_vars/all.yml

  pre_tasks:

  - name: Pretask | Running pre tasks routine
    shell: echo 'I":" Beginning to configure the system...'

  - name: Pretask | Update apt cache
    apt: update_cache=yes cache_valid_time=3600

  roles:
    - common
    - package-mgmt
    - shell-settings
    - shell-tools
    #- desktop-kit
    - desktop-google-chrome
    - desktop-virtualbox
    - desktop-skype
    - desktop-teamviewer
    - local-storage
    - desktop-insync
    - desktop-fingerprint
    - desktop-vagrant
    - desktop-flux
```

## Running the Ansible playbook

Antes de ejecutar el playbook modifique el archivo del playbook localsystem.yml, cambie el valor de la variable 'user' con el nombre de usuario con el que ejecutara el playbook, por ejemplo:

```
- hosts: localhost
  connection: local
  user: jorge
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local user jorge and use sudo to gain privileges, note that 'become' replaces the old 'sudo' parameter.

## Running only a group of tasks using tags

If you remember, in the main playbook localsystem.yml we use roles to group task associated to a program, I have tagged every task in the different playbooks for each rol, so if you want to run only  the task asociated to a rol, use the '--tags' parameter, for example:


```
$ sudo ansible-playbook localsystem.yml -K --tags=desktop_virtualbox,desktop_skype
```

Cada rol incluye una o más taras, algunas agrupadas con identificadores de etiquetas, las tareas de un rol pueden contener más de una etiqueta, aquí se listan las principales de cada rol:

- common: system_settings
- common: system_settings_timezone
- package-mgmt: clean_package_mgmt
- package-mgmt: purge_package_mgmt
- package-mgmt: reposetup_package_mgmt
- shell-settings: shell_settings
- shell-tools: shell_tools
- desktop-kit: desktop_kit_shell
- desktop-kit: desktop_kit_techdoc
- desktop-kit: desktop_kit_security
- desktop-kit: desktop_kit_development
- desktop-kit: desktop_kit_imageedit
- desktop-kit: desktop_kit_web_im_mail
- desktop-kit: desktop_kit_remoteadmin
- desktop-kit: desktop_kit_audiovideo
- desktop-kit: desktop_kit_productivity
- desktop-kit: desktop_kit_libvirt_desk
- desktop-kit: desktop_kit_sshvpn
- desktop-google-chrome
- desktop-virtualbox: desktop_virtualbox
- desktop-skype: desktop_skype
- desktop-teamviewer
- local-storage: desktop_local_storage
- desktop-insync: desktop_insync
- desktop-fingerprint
- desktop-vagrant: desktop_vagrant
- desktop-flux

IMPORTANT: Be careful when you run tasks from the desktop-kit role, there are some heavy apps you may not need.

For example, lets run the tasks for system settings:

```
$ ansible-playbook localsystem.yml -K --tags=system_settings,system_settings_timezone
```

'NOTA:' Aquí uso el parametro '-K' para que pregunte la contraseña de sudo para ejecutar las taras.

Let's run the tasks for the package management and shell tools and settings:

```
$ ansible-playbook localsystem.yml -K --tags=clean_package_mgmt,purge_package_mgmt,reposetup_package_mgmt,system_settings,system_settings_timezone
```

Now, lets run some tasks for more advanced desktop requirements:

```
$ ansible-playbook localsystem.yml -K --tags=desktop_kit_shell,desktop_kit_security,desktop_kit_development,desktop_kit_imageedit,desktop_kit_audiovideo,desktop_kit_productivity,desktop_kit_libvirt_desk,desktop_kit_sshvpn
```

Let's run some tasks for development:

```
$ ansible-playbook localsystem.yml -K --tags=desktop_virtualbox,desktop_skype,desktop_local_storage,desktop_insync,desktop_vagrant
```

## Creating new roles

If you want to group lots of tasks with a different purpose, I recommend you to create
a dedicated playbook inside a role, you can create a role using the command ansible-galaxy,
for example:

First, go inside your main directory on your proyect, we expect a roles directory on the
root.

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

Ansible galaxy will create the role files and directories structure, most of the work
is on the tasks directory, inside the main.yml file.

```
$ vim roles/desktop-insync/tasks/main.yml
```

Before you can run the tasks on this new role, you have to incluide it on the main
playbook, that is localsystem.yml, for example:

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
#    - desktop-kit
    - desktop-google-chrome
    - desktop-virtualbox
    - desktop-skype
    - desktop-teamviewer
    - local-storage
    - desktop-insync
    - desktop-fingerprint
    - desktop-vagrant
#    - rsyslog-service
#    - openssh-service
#    - ntp-service
#    - system-update
```
That is, if you want to clone this repository go ahead, please give feed back if you
want to help to improve this.

## Mejores prácticas

Para el caso de una PC con Ansible, solo es necesario un playbook principal que puede ser
localsystem.yml el cual incluye uno o varios roles con diferentes tareas.

Para construir la estructura del rol se debe usar ansible-galaxy, el nombre debe ser rol-service.

IMPORTANTE: Los roles deben usar guión medio para separar las palabras que componen el nombre del
 rol, se aconseja que los nombres de los roles terminen con "-service".

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

Si desea contribuir al código se recomienda clonar el repositorio y trabajar en un
feature branch o en development y hacer pull request para integrar a la rama master
del ambiente de production.

La rama master está protegida para que solo usuarios con rol de owner o master puedan
hacer commits, la forma más segura de integrar cambios es hacer pull request y peer
review del código, para validarlo y probarlo en el ambiente de pruebas antes de poder
integrar el código al ambiente productivo.
