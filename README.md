# Ansible for my personal Kubuntu Desktop

## Introduction

I love GNU/Linux and I use it as the base operating system on my personal computers
at home and work.

I don't like to do repetitive work, I prefer to automate it, one task that I'd like
to automate is the setup process after installing the base operating system on my
laptops, I call this, the post-setup process, the requisite to automate something
is document it, so I wrote a guide which helps me to do this process manually,
with a script, or with a configuration management tool like Ansible.

This repository contains documentation and ansible playbooks to automatically install
all the programs I use at work and home. Most programs I use are open source, they
are included in the official repositories of Ubuntu, in this case for Ubuntu 20.04
(focal), I also requiere other programs wich are not open source, at least they are
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
   * Install Fingerprint reader
   * Install Oh my Zsh
 * Install extra communications, remote management, web and cloud sync
   * Install Teamviewer
   * Install Google Chrome
   * Install Insync
   * Install Zoom (disabled by default)
   * Install Slack (disabled by default)
 * Install extra developer and cloud admin tools
   * Install Atom (optional localdev.yml)
   * Install Google Cloud SDK (optional localdev.yml)
   * Install VirtualBox (optional localdev.yml)
   * Install Vagrant (option localdev.yml)
   * Install Packer (option localdev.yml)
   * Install Terraform (option localdev.yml)
   * Install AWS CLI (option localdev.yml)
   * Install Docker (option localdev.yml)

## Cloning the repository

First of all we are going to install some basic cli tools:

```
$ sudo apt install vim git
```

Now we need to go the directory we are going to work, and clone the repository
from gitlab, for example:

```
$ mkdir ~/data/vcs
$ cd ~/data/vcs
$ git clone https://gitlab.com/jorge.medina/ansible-my-kubuntu-desktop
$ cd ansible-my-kubuntu-desktop
```

## Installing and Testing Ansible

In order to install ansible, you need to run **bin/install-ansible-on-ubuntu.sh**,
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

The main playbook is **localsystem.yml**, let's display it:

```
$ cat localsystem.yml
---
- hosts: localhost
  connection: local
  user: ubuntu
  become: yes
  pre_tasks:
  - name: Pretask | Update apt cache
    apt: update_cache=yes
  roles:
    - common
    - package-mgmt
    - shell-settings
    - shell-tools
    - local-storage
    - desktop-kit
    - desktop-fingerprint
    - desktop-oh-my-zsh
    - desktop-teamviewer
    - desktop-anydesk
    - desktop-google-chrome
    - desktop-insync
    - desktop-zoom
    #- desktop-slack

```

## Running the Ansible playbook

Before you run ansible, plase edit localsystem.yml playbook file, change the
variable **user** with your own username, for example:

```
$ sed -i 's/ubuntu/jmedina/' localsystem.yml
```
So, it looks like this:

```
- hosts: localhost
  connection: local
  user: jmedina
  become: yes
```

As you could see in the playbook header, we connect to localhost with the local
user jmedina and use sudo to gain privileges, note that **become** replaces the
old **sudo** parameter.

```
$ ansible-playbook localsystem.yml -K
BECOME password:
```

**NOTE:** Here we use **-K** parameter so ansible asks for user password to run
tasks with privileges.

If you want to install those development and cloud management tools on your system,
you can run the **localdev.yml** playbook.

## Running only a group of tasks using tags

If you remember, in the main playbook localsystem.yml we use roles to group
task associated to a program, I have tagged every task in the different playbooks
for each role, so if you want to run only  the task asociated to a rol, use the
**--tags** with a comma separaed list of tags.

Each role includes more that one task, some of the are grouped, task on a role
can include more than one tag, here are the main tags:

 * **common:** system_settings
 * **common:** system_settings_timezone
 * **package-mgmt:** purge_package_mgmt
 * **package-mgmt:** reposetup_package_mgmt
 * **shell-settings:** shell_settings
 * **shell-tools:** shell_tools
 * **local-storage:** desktop_local_storage
 * **desktop-kit:** desktop_kit_shell
 * **desktop-kit:** desktop_kit_techdoc
 * **desktop-kit:** desktop_kit_security
 * **desktop-kit:** desktop_kit_development
 * **desktop-kit:** desktop_kit_imageedit
 * **desktop-kit:** desktop_kit_web_im_mail
 * **desktop-kit:** desktop_kit_remoteadmin
 * **desktop-kit:** desktop_kit_audiovideo
 * **desktop-kit:** desktop_kit_productivity
 * **desktop-kit:** desktop_kit_libvirt_desk
 * **desktop-kit:** desktop_kit_sshvpn
 * **desktop-fingerprint:** desktop_fingerprint
 * **desktop-teamviewer:** desktop_teamviewer
 * **desktop-anydesk:** desktop_anydesk
 * **desktop-google-chrome:** desktop_insync
 * **desktop-insync:** desktop_insync
 * **desktop-zoom:** desktop_zoom

**IMPORTANT:** Be careful when you run tasks from the desktop-kit role, there are some
heavy apps you may not need.

Now run ansible with a few simple tasks for system settings:

```
$ ansible-playbook localsystem.yml -K --tags=system_settings,system_settings_timezone
```

**NOTE:** Here we use **-K** parameter so ansible asks for user password to run
tasks with privileges.

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

## Creating new roles

If you want to group lots of tasks with a different purpose, I recommend you to
create a dedicated playbook inside a role, you can create a role using the command
ansible-galaxy, for example:

First, go inside your main directory on your proyect, we expect a roles
directory on the root.

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

**IMPORTANT:** You should use hypen `-` for role names composed of more than
2 words. We use `desktop-` for any desktop application.

Ansible galaxy will create the role files and directories structure, most of
the work is on the tasks directory, inside the main.yml file.

```
$ vim roles/desktop-insync/tasks/main.yml
```

Before you can run the tasks on this new role, you have to incluide it on the
main playbook, that is localsystem.yml, for example:

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
    - desktop-fingerprint
    - desktop-oh-my-zsh
    - desktop-teamviewer
    - desktop-google-chrome
    - desktop-insync
    - desktop-zoom
```

That is, if you want to clone this repository go ahead, please give feed back if
you want to help to improve this.

## Best practices

Follow this recommendations to write better playbooks:

 * Use descriptive task names in english.
 * Ident using 2 space.
 * Use new lines to separate each task
 * Use variables written based on format ansible 2.x.
 * Use role specific variables in `vars/main.yml`.
 * Use environment specific variables in `defaults/main.yml`.
 * Use host or group host specific variables in `hosts`.
 * Use standard variables from the inventory or facts so you dont have to write
   shell functions to capture data from hosts
 * Use python functions to get custom data.
 * Use tags for every group of tasks, use `_` for tag names.

## Contributing

If you want to contribute code to this repository, clone, create a feature branch,
work on your local copy and then send a Merge Request, we will make a code review.

