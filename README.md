# ansible-my-kubuntu-desktop

## Introduction

I use Linux as the base operating system of my personal computers at home and work, I don't like to do repetitive work, I prefer to automate it, one work that I'd like to automate is the setup process after installing the base operating system on my laptops, I call this, the post-setup process, the requisite to automate something is document it, so I wrote a guide which helps me to do this process manually, with a script, or with a configuration management tool like Ansible.

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

## Running the Ansible playbook

Antes de ejecutar el playbook modifique el archivo del playbook localsystem.yml, cambie el valor de la variable 'user' con el nombre de usuario con el que ejecutara el playbook, por ejemplo:

```
- hosts: localhost
  connection: local
  user: changeme
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local user '{{ user }}' and use sudo to gain privileges, note that 'become' replaces the old 'sudo' parameter.

```
$ sudo ansible-playbook localsystem.yml -K
```

'NOTA:' Aquí uso el parametro '-K' para que pregunte la contraseña de sudo para ejecutar las taras.

## Running only a group of tasks using tags

If you remember, in the main playbook localsystem.yml we use roles to group task associated to a program, I have tagged every task in the different playbooks for each rol, so if you want to run only  the task asociated to a rol, use the '--tags' parameter, for example:


```
$ sudo ansible-playbook localsystem.yml -K --tags=desktop_teamviewer,desktop_skype
```

## Creating new roles

Para crear un nuevo rol nos posicionamos en el directorio roles y usamos ansible-galaxy:

```
$ cd /etc/ansible/roles
$ ansible-galaxy init desktop-insync
```

Empiece editando el playbook de tareas:

```
$ vim roles/desktop-insync/tasks/main.yml
```

Para que aplique el rol debe agregarlo al playbook principal, por ejemplo:

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
    - desktop-kit
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
#    - snmpd-service
#    - system-update
```
That is, if you want to clone this repository go ahead, please give feed back if you want to help to improve this.
