#! /bin/bash

#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
echo "if de centos"
    echo "if de centos true"
	echo "Instalando EPEL"
	yum -y install epel-release
	echo "EPEL instalado"
	#condicion para revisar si está instalado clamav, si no instalarlo
	echo "Detectando ClamAV"
	if  (yum list -q installed clamav); 
	then
		echo "Instalando ClamAV"
		yum -y install clamav clamav-devel
	fi
yum update


exit