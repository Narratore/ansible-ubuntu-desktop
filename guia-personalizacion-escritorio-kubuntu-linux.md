# Mi Guía de Personalización de escritorio GNU/Linux basado en Kubuntu Linux

## Introducción

Este documento es mi guía de como personalizar al gusto un sistema de escritorio GNU/Linux basado en Kubuntu 14.04, describiré los procedimientos que realizo después de la instalación del sistema de escritorio GNU/Linux basado en la distribución Kubuntu 12.04, las actividades aquí descritas son realizadas principalmente desde la interfaz de línea de comandos y otras desde interfaces gráficas, principalmente en KDE y sus herramientas de configuración.

El resultado es dejar un sistema de escritorio listo y funcional para realizar todas las actividades diarias que requieren mis diferentes funciones en el trabajo como consultor de tecnologías de TI, principalmente orientadas a la administrador de redes y sistemas, también incluyo las actividades que permiten tener un sistema para uso personal.

## Objetivos

El objetivo es realizar diferentes atividades Las actividades que realizaremos son las siguientes:

 - Personalizar la configuración del entorno del shell bash
 - Instalación de grupos de paquetes oficiales
   - Configuración de los depósitos de paquetes oficiales de Kubuntu.
   - Configuración de los depósitos de paquetes PPA para Kubuntu.
   - Configuración de proxy HTTP en herramientas basadas en APT.
   - Instalación de programas para trabajo en la consola o shell.
   - Instalación de paquetes para documentación técnica con Docbook
   - Instalación de herramientas de seguridad para el shell y X11
   - Instalación de Herramientas para Desarrollo
   - Instalación de Herramientas para oficina y edición de imágenes
   - Instalación de paquetes para extras para KDE
   - Instalación de paquetes para Audio y Video
   - Instalación de herramientas de productividad
   - Instalación de sistema de virtualización KVM con virt-manager
 - Instalación de herramientas de terceros
   - Instalar el navegador Chromium
   - Instalar e navegador Google Chrome y plugin para Google hangouts
   - Instalación del cliente y servidor NX
   - Instalación de VirtualBox
   - Instalación de Dropbox
   - Instalación de Skype
   - Instalación de Teamviewer
   - Instalación de Jitsi
   - Instalación de Kazam
 - Configuraciones personalizadas para KDE
 - Configuración de programas y aplicaciones
 - Otras configuraciones
 - Cosas para respaldar

## Personalizar la configuración del entorno del shell bash

- Lo primero que vamos a hacer es configurar mi entorno del shell, en este caso bash.

Primero realizamos un respaldo de los archivos originales:

Creamos directorio de respaldos:
  
 $ mkdir -p backups/bash-dotfiles
  
 $ for dotfile in .profile .bash_profile .bashrc .bash_local .bash_aliases .bash_functions .bash_history;\
  do mv ~/$dotfile backups/bash-dotfiles/; done
  
Ahora agrego mis personalizaciones a los archivos dot de bash:

- Descargo la versión personalizada del archivo .profile:

$ wget http://tuxjm.net/jm-confs/bash/user/1204dotprofile -O ~/.profile

- Descargo una versión personalizada del archivo .bashrc:

$ wget http://tuxjm.net/jm-confs/bash/user/1204dotbashrc -O ~/.bashrc

Descarga una versión personalizada del archivo  .bash_local:

$ wget http://tuxjm.net/jm-confs/bash/user/1204dotbash_local -O ~/.bash_local

Descarga una versión personalizada del archivo .bash_aliases:

$ wget http://tuxjm.net/jm-confs/bash/user/1204dotbash_aliases -O ~/.bash_aliases

- Descargo una versión personalizada del archivo de configuración de VIM:

$ wget http://tuxjm.net/jm-confs/vim/1204vimrc -O ~/.vimrc

- Descargo una versión personalizada del archivo de configuración de screen:
   
$ wget http://tuxjm.net/jm-confs/screen/dotscreenrc-simple -O ~/.screenrc

Para cargarlas basta con abrir una nueva sesión o cargándolos así:

$ source .profile

## Instalación de grupos de paquetes oficiales

En esta sección veremos como instaló los grupos de paquetes que regularmente uso para realizar las actividades diarias tanto en trabajo como en casa.

### Configuración de los depósitos de paquetes oficiales de Kubuntu

TODO.

###  Configuración de los depósitos de paquetes PPA para Kubuntu

TODO.

### Configuración de proxy HTTP en herramientas basadas en APT

- Configurar Proxy para APT:

  Si salimos a Internet a través de un proxy HTTP, se recomienda configurar el proxy en la configuración de APT.

  $ sudo vi /etc/apt/apt.conf.d/88apt-proxy
  Acquire::http::Proxy "http://192.168.1.254:3128";

  Actualizamos los repositorios:

  $ sudo apt-get update

Si en algún momento queremos actualizar o instalar algún paquete y estamos conectados a una red que no tiene
proxy, simplemente comente la línea:

//Acquire::http::Proxy "http://192.168.1.254:3128";

Y vuelva a actualizar las listas de repositorios.

### Instalación de programas para trabajo en la consola o shell

La siguiente es una lista de paquetes que requiero para trabajar de forma eficiente en la línea de comandos, con ellas puedo realizar tares simples tales como, monitorizar el estado del sistema, administración de archivos y herramientas simples de red.

TODO: Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

Instalamos los programas con apt-get:

$ sudo apt-get install \
aptitude \
terminator \
yakuake \
htop \
vim \
expect \
tree \
gzip \
bzip2 \
zip \
unzip \
unrar \
lzop \
elinks \
ntp \
bind9utils \
samba \
winbind \
smbclient \
cifs-utils \
sshfs \
libpam-mount \
dnsutils \
whois \
traceroute \
wireshark \
tshark \
ipcalc \
nmap \
wakeonlan

NOTA: No yakuake para entorno ligero.

### Instalación de paquetes para documentación técnica con Docbook

Esta es una lista de herramientas que utilizó para la edición y publicación de documentación técnica basada
en Docbook XML, y otras herramientas de conversión.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
docbook-utils \
docbook-xsl \
docbook2odf \
xsltproc \
xmlto \
libxml2-utils \
fop \
libservlet2.4-java \
publican

### Instalación de herramientas de seguridad para el shell y X11

Esta es una lista de herramientas relacionadas a la seguridad, tanto para el shell como para entornos de trabajo gráficos.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
openssl \
libnss3-tools \
openssh-client \
gnupg \
gnupg-agent \
keychain \
pinentry-curses \
pinentry-qt4 \
kgpg \
ssh-askpass \
pwgen \
keepassx

no kgpg para entorno ligero

### Instalación de Herramientas para Desarrollo

Algunas herramientas para trabajar en entornos de desarrollo y compilación de software.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
build-essential \
diffutils \
cvs \
subversion \
git \
kdesvn \
kdiff3 \
kompare \
mysql-workbench
  
NOTA: No kompare kdiff3 ni kdesvn para entornos ligeros.
  
### Instalación de Herramientas para oficina y edición de imágenes

Herramientas para ver gráficos, libros electrónicos, fuentes tipográficas libres y traducción.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
xpdf \
kcalc \
xchm \
dia \
gimp \
kolourpaint4 \
ttf-liberation \
ttf-mscorefonts-installer \
aspell-es

No kcalc ni kolourpaint4 para entornos ligeros.

NOTA: En las distribuciones base de *buntu ya se incluye la suite de ofimatica openoffice/libreoffice, sin embargo, se recomienda instalar utilierias, lenguajes, etc.

### Instalación de paquetes para extras para KDE

Lista de programas extras para KDE, en especifico la parte visual y ofimática.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
kscreensaver kscreensaver-xsavers xscreensaver xscreensaver-gl \
xscreensaver-data xscreensaver-data-extra xscreensaver-gl-extra

NOTA: En versiones recientes se sustituyen los paquetes de ofimatica de KDE por caligra, por ejemplo,
kspreed por caligrasheets, kword por calligrawords.

### Instalación de paquetes para Web, IM, Correo y otros

Esta es una lista de programas que utilizo para navegación web, y otro tipo de comunicaciones.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
firefox \
flashplugin-installer \
openjdk-6-jre \
thunderbird \
enigmail \
pidgin \
pidgin-encryption \
konversation \
xvnc4viewer \
rdesktop \
krdc \
remmina

No konversation ni krdc para entornos ligeros.

NOTA: He remplazado kmess, kopete y kopete-cryptography en favor de pidgin y pidgin-encryption.
  
### Instalación de paquetes para Audio y Video

Herramientas para escuchar diferentes formatos de audio y video y otras relacionadas.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo apt-get install \
lame \
mplayer \
mencoder \
vlc \
amarok \
clementine \
easytag \
k3b \
k3b-i18n
  
NOTA: Opcionalmente puede instalar el metapaquete kubuntu-restricted-extras, este instala paquetes con licencias restrictivos.

### Instalación de Herramientas de Productividad

Para organizar mis ideas y proyectos uso freeplane para la creación de mapas mentales:

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

# apt-get install freeplane

Para almacenar información que voy generando o recopilando utilizo cherrytree para la gestión de notas de forma jerarquica:

# apt-get install cherrytree

Para crear diagramas de Gantt para los proyectos que administro instalo el programa ganttproject de http://www.ganttproject.biz/

$ cd ~/Descargas/Programas

$ wget http://dl.ganttproject.biz/ganttproject-2.6.6/ganttproject_2.6.6-r1715-1_all.deb

$ sudo dpkg -i ganttproject_2.6.6-r1715-1_all.deb

### Instalación de sistema de virtualización KVM con virt-manager

Instalamos el entorno de virtualización basado en KVM con sus herramientas gráficas:

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

$ sudo aptitude install qemu-kvm libvirt-bin virt-manager virt-viewer ssh-askpass

IMPORTANTE: Recuerde agregar el usuario a los grupos kvm y libvirtd.

## Instalación de herramientas de terceros

### Instalar el navegador Chromium

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

  $ sudo add-apt-repository ppa:chromium-daily/ppa && sudo apt-get update && sudo apt-get install chromium-browser

- Instalar certificado raíz Compugraf en Chromium:

  $ sudo apt-get install libnss3-tools
  $ wget http://mail.tuxjm.net/ca.crt -O /tmp/Tuxjm-rootca.crt
  $ certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "tuxjm.net" -i /tmp/Tuxjm-rootca.crt

- Abrir links thunderbird con chromium:

  $ gconftool-2 --type string -s /desktop/gnome/url-handlers/http/command "chromium-browser %s"
  $ gconftool-2 -g /desktop/gnome/url-handlers/http/command

### Instalar e navegador Google Chrome y plugin para Google hangouts

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

  Ir a la pagina: https://www.google.com/intl/es/chrome/browser/?hl=es y descargar el paquete .deb para 64-bit.
  
  Seleccionar la arquitectura, en mi caso 64 bit .deb (para Debian/Ubuntu)
  
  Al aceptar el acuerdo se descargara el paquete: google-chrome-stable_current_amd64.deb
  
  Antes de instalar el paquete de google chrome debemos de instalar unas dependencias:
  
  $ sudo apt-get install libcurl3
  
  Ve al directorio donde se descargo el archivo e instalalo así:
  
  $ sudo dpkg -i google-chrome-stable_current_amd64.deb

  El paquete google chrome automaticamente actualiza las alternativas:
  
  update-alternatives: utilizando /usr/bin/google-chrome para proveer /usr/bin/x-www-browser (x-www-browser) en modo automático.
  update-alternatives: utilizando /usr/bin/google-chrome para proveer /usr/bin/gnome-www-browser (gnome-www-browser) en modo automático.

  El paquete agrega automaticamente el deposito de paquetes para google chrome, asi sera posible
  instalar las actualizaciones usando cualquier gestor de paquetes en Debian/Ubuntu.
  
  $ cat /etc/apt/sources.list.d/google-chrome.list 
  ### THIS FILE IS AUTOMATICALLY CONFIGURED ###
  # You may comment out this entry, but any other modifications may be lost.
  deb http://dl.google.com/linux/chrome/deb/ stable main
  
- Instalamos el plugin de google hangout para chrome:

Descargamos el paquete correspondiente a la arquitectura del sistema desde el URL:
https://www.google.com/tools/dlpage/hangoutplugin/download.html?hl=es.

Lo instalamos usando el comando:

$ sudo dpkg -i google-talkplugin_current_amd64.deb

Y listo, reiniciamos el navegador y ya está activado el plugin, ya podemos hablar desde gmail o google+.

  El paquete agrega automáticamente el deposito de paquetes para google talkplugin, así sera posible
  instalar las actualizaciones usando cualquier gestor de paquetes en Debian/Ubuntu.
  
$ cat /etc/apt/sources.list.d/google-talkplugin.list
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb http://dl.google.com/linux/talkplugin/deb/ stable main

### Instalación de VirtualBox

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

Las instrucciones las saque de la página oficial: https://www.virtualbox.org/wiki/Linux_Downloads.

Configuramos el repositorio para virtualbox:

# vim /etc/apt/sources.list.d/virtualbox.list
deb http://download.virtualbox.org/virtualbox/debian trusty contrib

Configuramos la llave para apt:

$ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

Actualizamos los repositorios e instalamos el paquete:

$ sudo apt-get update

$ sudo apt-get install virtualbox-4.3

Si va a usar dispositivos USB debe bajar el extension pack correspondiente a la versión de virtualbox:

https://www.virtualbox.org/wiki/Downloads

### Instalación de Skype

El programa skype ya esta en el repositorio partner en Ubuntu 14.04, sin embargo, este repositorio no
está habilitado por default. Sigamos el siguiente repositorio para instalar skype:

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

- Habilitar el repositorio en el archivo sources.list:

$ sudo vim /etc/apt/sources.list

Descomentar la línea:

deb http://archive.canonical.com/ubuntu trusty partner

- Actualizar los repositorios:

$ sudo apt-get update

- Instalar el programa:

$ sudo apt-get install skype

### Instalación de Teamviewer

Teamviewer provee versiones para arquitecturas de 32 y 64-bit, por alguna razón no he podido
instalar la versión para 64-bit, por lo que usaremos la versión 32-bit en modo multilib.

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

Usando el programa wget descargamos el paquete .deb desde el URL oficial: 
http://www.teamviewer.com/es/download/linux.aspx.

$ cd ~/Descargas/Programas

http://download.teamviewer.com/download/teamviewer_i386.deb
 
Usando el programa dpkg lo instalamos:

# dpkg -i teamviewer_linux.deb

$ sudo dpkg -i teamviewer_10.0.36281_i386.deb 
[sudo] password for jmedina: 
Seleccionando el paquete teamviewer previamente no seleccionado.
(Leyendo la base de datos ... 248861 ficheros o directorios instalados actualmente.)
Preparing to unpack teamviewer_10.0.36281_i386.deb ...
Unpacking teamviewer (10.0.36281) ...
dpkg: problemas de dependencias impiden la configuración de teamviewer:
 teamviewer depende de libjpeg62.
 teamviewer depende de libxinerama1.
 teamviewer depende de libxrandr2.
 teamviewer depende de libxtst6.

dpkg: error al procesar el paquete teamviewer (--install):
 problemas de dependencias - se deja sin configurar
Se encontraron errores al procesar:
 teamviewer
 
Es probable que el programa no se instale completamente debido a dependencias no resueltas, para
resolverlas ejecutar el siguiente comando:

# apt-get -f install

Ya tenemos el programa teamviewer en modo i386 instalado.

Para ejecutarlo podemos ir al menú de inicio, algún shortcut o vía consola, por ejemplo:
   
$ teamviewer 

Init...
Checking setup...
Launching TeamViewer ...

Listo, a usarlo :)


### Instalación de Dropbox

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.

Primero debemos descargar el paquete .deb de la página oficial de Dropbox:
https://www.dropbox.com/install?os=lnx, o desde el URL directo:
https://www.dropbox.com/download?dl=packages/debian/dropbox_1.6.0_amd64.deb

Instalamos el paquete:

$ cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

Ejecutar:

$ dropbox start -i

para descargar daemon.

A continuación, ejecuta el demonio de Dropbox desde la carpeta .dropbox-dist recién creada.

~/.dropbox-dist/dropboxd

Configurar cuenta

Configurar carpeta
Configurar sincronización

$ dropbox stop && dropbox start && watch dropbox status

### Instalación del cliente y servidor NX

TODO

Antes de instalar los paquetes hace una pequeña descripción de cada uno de los paquetes incluyendo nombre, propósito, uso y algún otro tipo referente al programa.


### Instalación de cliente de escritorio virtual QVD

Agregamos el deposito de paquetes PPA de QVD:


Instalamos el cliente QVD:


Configuramos el cliente QVD:


## Configuraciones personalizadas para KDE

- Configuraciones de Apariencia y comportamiento comunes.

  Configurar shortcuts para cambiarse entre escritorios:
  
  Ir a Preferencias del sistema => Accesos rápidos de teclado globales
  
    Seleccionar Componente de KDE: KWin

      Cambiar al escritorio 1: Alt+1  
      Cambiar al escritorio 2: Alt+2
      Cambiar al escritorio 3: Alt+3
      Cambiar al escritorio 4: Alt+4

  Configurar shortcuts para ventanas:
  
  Ir a Preferencias del sistema => Accesos rápidos de teclado globales
  
    Seleccionar Componente de KDE: KWin
  
      Maximizar la ventana horizontalmente: Alt+F10
      Maximizar la ventana verticalmente: Alt+F11
      
  Configurar Accesos del shell de escritorio Plasma
  
  Ir a Preferencias del sistema => Accesos rápidos de teclado globales
  
    Seleccionar Componente de KDE: Shell de escritorio Plasma
    
      Activar el elemento gráfico Lanzador de aplicaciones: Alt+F1
      Actividad anterior: Meta+Mayúsculas+Tab
      Actividad siguiente: Meta+Tab
      Actividades...: Meta+Q
      Detener la actividad actual: Meta+S
      Mostrar el tablero de mandos: Ctrl+F12
      SystemTray-Klipper-6: Ctrl+Alt+Vv

  Configurar parámetros de regionalización.

  Ir a Preferencias del sistema => Local
  
  País/región e Idioma
  
    En la pestaña País => País: País del sistema (México)
    En la pestaña Idiomas, seleccionar Español e Inglés americano, dar preferencia a Español.
    En la pestaña Otros, cambiar Tamaño de hoja: Carta de EE.UU.
  
  Corrector ortográfico
  
    Idioma predeterminado: Español

- Configuraciones de Apariencia y comportamiento del espacio de trabajo

  Ir a Preferencias del sistema => Comportamiento del espacio de trabajo
  
    Escritorios virtuales => Pestaña Escritorios => Número de escritorios: 4
    Escritorios virtuales => Pestaña Escritorios => Número de filas: 1
    Escritorios virtuales => Activar Componentes gráficcos distintos para cada escritorio
    Escritorios virtuales => Pestaña Cambio: Activar Navegación cíclica para los escrtorios
    Escritorios virtuales => Pestaña Cambio: Animación: Deslizar
    
- Configurar la barra de tareas y múltiples escritorios:

  Hacer clic con el botón derecho sobre la barra de tareas => Preferencia del Gestor de Tareas:

    En Apariencia => Desactivar opción de Mostrar consejos
    En Apariencia => Máximo dde filas: 2
    En Agrupación y ordenación => Agrupación: No agrupar
    En Agrupación y ordenación => Ordenación: No ordenar
    En Filtros => Mostrar solo tareas de la pantalla actual
    En Filtros => Mostrar solo tareas del escritorio actual.
    En Filtros => Mostrar solo tareas de la actividad actual.

- Configurar el bloqueador de pantalla y bloqueo automático.

  Ir a Preferencias del sistema => Pantalla y Monitor => Bloqueador de Pantalla
  
    Seleccionar Iniciar automáticamente después de: 5 minutos
    Seleccionar Seleccionar contraseña después de: 60 segundos
    Seleccionar uno de la lista: Salvapantallas OpenGL: Euforia (GL)

  NOTA: Requiere los paquetes: kscreensaver, xscreensaver-data, kscreensaver-xsavers, xscreensaver-gl

- Configurar terminarl yakuake

  Cambiar accesos rápidos: Abrir/retraer Yakuake: Meta+F12
  
## Configuración de programas y aplicaciones

### Configurando del cliente y servidor OpenSSH

Instalamos los programas:

$ sudo apt-get install openssh-client openssh-server

$ sudo vim /etc/ssh/sshd_config

$ sudo /etc/init.d/ssh restart

### Configuración de Samba

Respaldamos la configuración original:

# cp /etc/samba/smb.conf{,.orig}

Editamos el archivo de configuración:

# vim /etc/samba/smb.conf

### Configurando el cliente de OpenVPN

# apt-get install openvpn

### Instalar los lm sensors

Instalamos los programas:

$ sudo apt-get install lm-sensors

## Otras configuraciones de sistema

- Deshabilitar beep del sistema:

  $ sudo sh -c 'echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist'

- Montar samba como usuario:

  $ sudo chmod a+s /sbin/mount.smbfs
  $ sudo chmod a+s /sbin/mount.cifs
  $ sudo chmod a+s /sbin/umount.cifs NO EXISTE?

  $ sudo dpkg-statoverride --update --add root root 4755 /sbin/mount.smbfs
  $ sudo dpkg-statoverride --update --add root root 4755 /sbin/mount.cifs
  $ sudo dpkg-statoverride --update --add root root 4755 /sbin/umount.cifs

  $ dpkg-statoverride --list | grep -E 'smbfs|cifs'
  root root 4755 /sbin/mount.cifs
  root root 4755 /sbin/mount.smbfs
  root root 4755 /sbin/umount.cifs

- Deshabilitar IPv6:

  $ sudo vim /etc/default/grub
  GRUB_CMDLINE_LINUX_DEFAULT="quiet splash ipv6.disable=1"

  $ sudo update-grub2

- Configurar cliente wakeonlan

  Definir hosts:

  $ sudo vim /etc/ethers
  40:61:86:0d:2c:e7       jmdesk

## Cosas para respaldar

## Archivos a Respaldar

Configuracion del cliente SSH:
  ~/.ssh

Configuracion del cliente GNUPG:
  ~/.gnupg

Configuracion de NSSDB:
  ~/.pki

Configuracion de Subversion:
  ~/.subversion

Configuración keepassx:
  ~/.pwdbs

Configuración XMLedit:
  ~/.xxe

- kopete
  ~/.kde/share/config/kopeterc
  ~/.kde/share/apps/kopete

- konversation
  ~/.kde/share/config/konversationrc
  ~/.kde/share/apps/konversation

- kmess
  ~/.kde/share/config/kmessrc
  ~/.kde/share/config/kmess.notifyrc
  ~/.kde/share/apps/kmess
  ~/.kmess

- Amarok

- Papelera KDE:
  ~/.local/Thrash

- firefox
  ~/.mozilla/firefox/*.default

- thunderbird
  ~/.thunderbird
  ~/.mozilla-thunderbird

- chromium
  ~/.config/chromium
 
- amsn
 ~/.amsn
