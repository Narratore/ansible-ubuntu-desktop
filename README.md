# ansible-my-kubuntu-desktop

## Introduction

Repositorio con playbooks para instalar y configurar mi equipo de escritorio.


## Descargue

Nos posicionamos en un directorio de trabajo:

```
$ cd ~/data/vcs/ansible-my-kubuntu-desktop
$ git clone https://github.com/jorgearma1982/ansible-my-kubuntu-desktop.git
$ cd ansible-my-kubuntu-desktop
```

## Ejecutando el playbook

Modifique el playbook localsystem.yml la variable 'user' y cambiela con el nombre de usuario con el que ejecutara el playbook.

```
$ sudo ansible-playbook localsystem.yml -K
```

NOTA: Usamos el parametro -K para que pregunte la contraseña de sudo para ejecutar las taras.

## Ejecutando solo un grupo de tareas

Si solo quiere ejecutar un solo grupo de tareas use los tags:

```
$ sudo ansible-playbook localsystem.yml -K --tags=desktop_teamviewer,desktop_skype
```

## Creando nuevos roles

Para crear un nuevo rol nos posicionamos en el directorio roles y usamos ansible-galaxy:

```
$ cd /etc/ansible/roles
$ ansible-galaxy init desktop-insync
```

Empiece editando el playbook de tareas:

```
$ vim roles/desktop-insync/tasks/main.yml
```

## Aplicando nuevos roles

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
#    - rsyslog-service
#    - openssh-service
#    - ntp-service
#    - snmpd-service
#    - system-update
```

