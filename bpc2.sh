#! /bin/bash

#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
echo "$UNAME"
Flag=$(yum list installed | grep epel)
	if [[ -z "$Flag" ]];
	then
		echo "Instalando EPEL"
		yum -y install epel-release
		echo "EPEL instalado"
	else 
		echo "EPEl ya está instalado"
	fi
	echo "Detectando ClamAV"
	Flag=$(yum list installed | grep epel)
	if  [[ -z "$Flag" ]]; 
	then
		echo "Instalando ClamAV"
		yum -y install clamav clamav-devel
	else 
		echo "ClamAV ya está instalado "
	fi
yum update


exit