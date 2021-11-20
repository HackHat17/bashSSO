#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
centos="CentOS Linux"
ubuntu="Ubuntu"

if [["$UNAME" = "$ubuntu"]];
then
echo "es ubuntu"

else 
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

		

		echo "¿deseas actualizar? (y/n)"
		read ack

		y="y"
		n="n"

		if [["$ack" = "$y"]];
		then
			echo "buscando actualizaciones"
			yum update
		else 
			echo "actualización cancelada"


fi



exit