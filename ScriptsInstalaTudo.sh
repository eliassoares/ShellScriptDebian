#!/bin/bash
#30/09/15
#Dê autorização de execução ao Script:  chmod +x Script
#Coloque esse script na pasta Download e execute como root.

echo "Instalando e atualizando programas necessários!"

#------------------------------------------------------------------
echo "Alterando o /etc/apt/sources.list..."

	echo "deb http://ftp.br.debian.org/debian/ stable main" > /etc/apt/sources.list
	echo "deb-src http://ftp.br.debian.org/debian/ stable main" >> /etc/apt/sources.list
	echo "deb http://security.debian.org/ stable/updates main contrib" >> /etc/apt/sources.list
	echo "deb-src http://security.debian.org/ stable/updates main contrib" >> /etc/apt/sources.list
	echo "# stable-updates, previously known as 'volatile'" >> /etc/apt/sources.list
	echo "deb http://ftp.br.debian.org/debian/ stable-updates main contrib" >> /etc/apt/sources.list
	echo "deb-src http://ftp.br.debian.org/debian/ stable-updates main contrib" >> /etc/apt/sources.list
	echo "deb http://http.debian.net/debian/ stable main contrib non-free" >> /etc/apt/sources.list 
	echo "deb http://sft.if.usp.br/debian-security/ stable/updates main contrib non-free" >> /etc/apt/sources.list
	echo 'deb http://packages.linuxmint.com debian import' >> /etc/apt/sources.list
	#echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" >> /etc/apt/sources.list

echo ".../etc/apt/sources.list atualizado."

#-------------------------------------------------------------
echo "Atualizando o Debian..."
	apt-get update
	
echo "...Debian atualizado."

#--------------------------------------------------------------
	echo "Programas para manipulação de músicas:"
		apt-get install puddletag
		apt-get install cowbell
		apt-get install kid3
		apt-get -y install rhythmbox*
		apt-get -y install clementine 
		
#--------------------------------------------------------------

	#wget -nv https://download.owncloud.org/download/repositories/8.2/Debian_8.0/Release.key -O Release.key
	#apt-key add - < Release.key
	#sh -c "echo 'deb https://download.owncloud.org/download/repositories/8.2/Debian_8.0/ /' >> /etc/apt/sources.list.d/owncloud.list"
	#apt-get update
	#apt-get install owncloud

#--------------------------------------------------------------
echo "Instalando Firefox:"
	apt-get purge iceweasel
	apt-get update
	gpg --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2
	gpg --export 3EE67F3D0FF405B2 > 3EE67F3D0FF405B2.gpg
	apt-key add ./3EE67F3D0FF405B2.gpg
	rm ./3EE67F3D0FF405B2.gpg
	apt-get update
	apt-get install firefox


#--------------------------------------------------------------

echo "Instalando Google Chrome..."
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	dpkg -i google-chrome-stable_current_amd64.deb
	apt-get -y install -f

echo "...Google Chrome instalado."

#--------------------------------------------------------------

echo "Instalando Adobe Flash Plugin..."
	apt-get -y install flashplugin-nonfree
	update-flashplugin-nonfree --install
echo "...Adobe Flash Plugin instalado."

#--------------------------------------------------------------

echo "Instalando descompactadores..."
	apt-get install file-roller
	apt-get -y install p7zip-full unrar-free
	kill -s HUP `pidof nautilus`
echo "...descompactadores instalados."

#--------------------------------------------------------------
	
echo "Instalando o youtube-dl..."	
	echo "deb http://ftp.br.debian.org/debian-backports/ squeeze-backports main" >> /etc/apt/sources.list
	apt-get update
	apt-get -y install youtube-dl
echo "...youtube-dl instalado."

#--------------------------------------------------------------

echo "Instalando Spotfy..."
	echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
	apt-get update
	wget -c http://ftp.us.debian.org/debian/pool/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_amd64.deb
	dpkg -i libgcrypt11_1.5.0-5+deb7u3_amd64.deb
	apt-get -y install spotify-client
	#criando ícone:
	echo "[Desktop Entry]" > /usr/share/applications/Spotify.desktop
	echo "Name= Spotify" >> /usr/share/applications/Spotify.desktop
	echo "GenericName = Music Player" >> /usr/share/applications/Spotify.desktop
	echo "Comment=Listen to music using Spotify" >> /usr/share/applications/Spotify.desktop
	echo "Icon= /opt/spotify/spotify-client/Icons/spotify-linux-48.png" >> /usr/share/applications/Spotify.desktop
	echo "Exec= /opt/spotify/spotify-client/spotify" >> /usr/share/applications/Spotifyfy.desktop
	echo "TryExec= /opt/spotify/spotify-client/spotify" >> /usr/share/applications/Spotify.desktop
	echo "Terminal=false" >> /usr/share/applications/Spotify.desktop
	echo "Type= Application" >> /usr/share/applications/Spotify.desktop
	echo "Categories=Audio;Music;Player" >> /usr/share/applications/Spotify.desktop
	echo "MimeType=x-scheme-handler/spotify" >> /usr/share/applications/Spotify.desktop
	cp /usr/share/applications/Spotify.desktop /home/eliassoares/Desktop/
echo "...Spotfy instalado."

#--------------------------------------------------------------

echo "Instalando o VLC..."
	apt-get -y install vlc
echo "...VLC instalado"

#--------------------------------------------------------------
echo "Instalando Games..."
	apt-get install zsnes
echo "...Games instalados."

#--------------------------------------------------------------
echo "Instalando o calibre..."
	apt-get -y install calibre
echo "...calibre instalado."

#--------------------------------------------------------------

echo "Instalando o skype..."
	dpkg --add-architecture i386
	apt-get update 
	aptitude -y install libqt4-dbus:i386 libqt4-network:i386 libqt4-xml:i386 libqtcore4:i386 libqtgui4:i386 libqtwebkit4:i386 libxss1:i386 libxv1:i386 libssl1.0.0:i386 libasound2:i386 
	
	wget http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb
	dpkg -i skype-debian_4.3.0.37-1_i386.deb
	
	#Aqui pode dar problema: vai tentar baixar o drive de vídeo:
	apt-get -y install -f	

echo "...skype instalado."

#--------------------------------------------------------------

echo "Instalando Dropbox..."
	apt-get -y install nautilus-dropbox 
echo "...Desktop instalado."

#--------------------------------------------------------------
echo "Instalando MegaSync..."
	wget https://mega.nz/linux/MEGAsync/Debian_8.0/amd64/megasync-Debian_8.0_amd64.deb
	wget https://mega.nz/linux/MEGAsync/Debian_8.0/amd64/nautilus-megasync-Debian_8.0_amd64.deb
	dpkg -i megasync-Debian_8.0_amd64.deb
	dpkg -i nautilus-megasync-Debian_8.0_amd64.deb
echo "...MegaSync instalado."
#--------------------------------------------------------------

echo "Instalando programas para programação ..."
	#servidor:
	aptitude install mysql-server mysql-client
	aptitude install apache2 apache2-doc
	aptitude install php5 php5-mysql libapache2-mod-php5
	aptitude install perl libapache2-mod-perl2
	aptitude install libapache2-mod-python
	aptitude install phpmyadmin
	
	apt-get -y install build-essential
	apt-get -f install
	apt-get -y install build-essential
	
	apt-get -y install python-numpy python-scipy python-matplotlib ipython
	apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy libatlas-dev libatlas3gf-base
	apt-get -y install python-sklearn
	apt-get -y install bpython3 bpython idle-python2.7 idle-python3.4 idle 
	apt-get update
	apt-get install python-setuptools
	apt-get -y install python-pip
	pip install tweepy
	pip install python-twitter
	pip install plotly
	pip install -U nltk
	pip install -U numpy
	pip install twill
	pip install foursquare
	easy_install html2text
	easy_install mechanize
	pip install --upgrade google-api-python-client
	pip install goslate
	pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
	apt-get install git-all



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "Instalando o Sublime..."
	wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
	dpkg -i sublime-text_build-3083_amd64.deb
	#cp /usr/share/applications/Sublime Text.desktop
echo "...Sublime instalado."

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "Instalando programas de LaTex..."
	apt-get -y install texmaker texlive texlive-lang-latin 
	cp /usr/share/applications/Texmaker.desktop
echo "...LaTex instalado."


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "Instalando Netbeans 8..."
	#wget download.oracle.com/otn-pub/java/jdk-nb/8-8.0/jdk-8-nb-8-linux-x64.sh
	#chmod +x jdk-8-nb-8-linux-x64.sh
	#./jdk-8-nb-8-linux-x64.sh
echo "...Netbeans 8 instalado"

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


echo "Instalando o Eclipse..."
	#wget -i http://www.eclipse.org/downloads/download.php?file=/oomph/epp/mars/R1a/eclipse-inst-linux64.tar.gz
	#mv eclipse-inst-linux64.tar.gz /opt/
	#tar -xvf /opt/eclipse-inst-linux64.tar.gz
	#criando ícone:
	#echo "[Desktop Entry]" > /usr/share/applications/eclipse.desktop
	#echo "Name=Eclipse" >> /usr/share/applications/eclipse.desktop
	#echo "Type=Application" >> /usr/share/applications/eclipse.desktop
	#echo "Exec=/opt/eclipse/eclipse" >> /usr/share/applications/eclipse.desktop
	#echo "Terminal=false" >> /usr/share/applications/eclipse.desktop
	#echo "Icon=/opt/eclipse/icon.xpm" >> /usr/share/applications/eclipse.desktop
	#echo "Comment=Integrated Development Environment" >> /usr/share/applications/eclipse.desktop
	#echo "Categories=Development;IDE;" >> /usr/share/applications/eclipse.desktop
	#echo "NoDisplay=false" >> /usr/share/applications/eclipse.desktop
	#echo "Name[en]=eclipse.desktop" >> /usr/share/applications/eclipse.desktop
	#desktop-file-install /usr/share/applications/eclipse.desktop
	#ln -s /opt/eclipse/eclipse /usr/local/bin/
	#cp /usr/share/applications/eclipse.desktop /home/eliassoares/Desktop/
	#segunda forma:
	apt-get -y install eclipse eclipse-egit eclipse-anyedit eclipse-jdt eclipse-cdt eclipse-cdt-autotools eclipse-cdt-jni eclipse-emf eclipse-wtp
	apt-get update
	cp /usr/share/applications/eclipse.desktop	 /home/eliassoares/Desktop/
echo "...Eclipse instalado."

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "Instalando o virtualbox..."
	echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" >> /etc/apt/sources.list
	apt-get update
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- |  apt-key add -
	apt-get -y install virtualbox-5.0
echo "...virtualbox instalado."

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "Instalando Android Studio..."
	#wget -c http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz
	#mv android-sdk_r24.3.4-linux.tgz /opt/
	#tar -xvf /opt/android-sdk_r24.3.4-linux.tgz

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

echo "...programas de programação instalados."

#--------------------------------------------------------------

echo "Aplicando algumas configurações."

echo "Configurando monitor 1080p..."
	xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
	xrandr --addmode VGA1 1920x1080_60.00
	xrandr --output VGA1 --mode 1920x1080_60.00
echo "...monitor configurado."


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


echo "Programas que pedem permissão:"
	echo "deb http://www.deb-multimedia.org stable main non-free" >> /etc/apt/sources.list
	apt-get update
	apt-get install debian-archive-keyring deb-multimedia-keyring
	apt-get update
	
#----------------------------------------------------------

echo "Instalando Java 8..."
	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
	apt-get update
	apt-get purge openjdk*
	apt-get -y install oracle-java8-installer
	apt-get install oracle-java8-set-default
echo "...Java 8 instalado."

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


echo "Removendo alguns arquivos que foram baixados..."

	#rm /opt/android-sdk_r24.3.4-linux.tgz
	echo "...Android Studio removido."

	rm google-chrome-stable_current_amd64.deb
	rm linux_signing_key.pub
	echo "...Google Chrome removido."

	rm libgcrypt11_1.5.0-5+deb7u3_amd64.deb
	echo "...Biblioteca do Spotfy removida."

	rm /opt/eclipse-inst-linux64.tar.gz
	echo "...Eclipse removido."

	rm jdk-8-nb-8-linux-x64.sh
	echo "...Netbeans removido."

	rm sublime-text_build-3083_amd64.deb
	echo "...Sublime removido."

	rm dropbox_2015.02.12_amd64.deb
	echo "...Dropbox removido."

	rm skype-debian_4.3.0.37-1_i386.deb
	echo "...Skype removido."
	
	rm megasync-Debian_8.0_amd64.deb
	rm nautilus-megasync-Debian_8.0_amd64.deb
	echo "...MegaSync removido."


echo "...arquivos desnecessários foram removidos."
