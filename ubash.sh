#! /bin/bash
#identifica OS
	UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
	echo "El sistema es: "
	echo "$UNAME"
		echo "Detectando ClamAV"
		if  (apt list clamav); 
		then
			echo "Instalando ClamAV"
			apt-get install clamav clamav-daemon -y
		else 
			echo "ClamAV ya está instalado "
		fi
