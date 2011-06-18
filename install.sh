#!/bin/bash
if (( $UID != 0));then
	echo "This script must be run as root!"
	exit 1 
else
	:
fi

install_blattacks() {
        sleep 1
        rm -f /sbin/blattack*
        rm -rf /opt/blattacks
        mkdir /opt/blattacks
        cp -rf  * /opt/blattacks/
        ln -s /opt/blattacks/src/blattacks.sh /sbin/blattacks
#	ln -s /opt/blattacks/src/kill-blattacks.sh /sbin/blattacks-kill
}



install_configuration_file() {
	cp -f  conf/blattacks.conf /etc
        echo "Configuration file created at /etc/blattacks.conf"
}



if [ -x /sbin/blattacks ]; then
	read -p "You have already installed blattacks. Would you like to update it? [y/n] " UPDATE
	if [ $UPDATE = "y" ];then
		echo "Updating blattacks..."
		install_blattacks
		echo "Blattacks successfully updated."
		sleep 1 
	else
		echo "Installation CANCELLED!"
		exit 1
	fi
else
	echo "Installing blattacks..."
	install_blattacks
	echo "Blattacks successfully INSTALLED."
	sleep 1
fi


if [ -e /etc/blattacks.conf ];then
     read -p "Overrite old /etc/blattacks.conf? [y/n] " X
     if [ $X = "y" ];then
          install_configuration_file
     else
          echo "Prior configuration file was kept."
     fi
else
	install_configuration_file
fi

exit 0
