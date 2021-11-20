#! /bin/bash

#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
echo "$UNAME"
	if (yum list -q installed epel-release);
	then
		echo "Instalando EPEL"
		yum -y install epel-release
		echo "EPEL instalado"
	else 
		echo "EPEl ya está instalado"
	fi
	echo "Detectando ClamAV"
	if  (yum list -q installed clamav); 
	then
		echo "Instalando ClamAV"
		yum -y install clamav clamav-devel
	else 
		echo "ClamAV ya está instalado "
	fi
yum update


exit