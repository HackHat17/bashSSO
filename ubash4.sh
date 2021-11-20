#! /bin/bash
#identifica OS
echo "Detectando SO"
#imprimir OS
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
OS=$(hostnamectl | grep ubuntu)
if [ -z "$OS" ];
then
	echo "El sistema es: "
	echo "$UNAME"
	Flag=$(yum list installed | grep epel)
		if [ -z "$Flag" ];
		then
			echo "Instalando EPEL"
			yum -y install epel-release
			echo "EPEL instalado"
		else 
			echo "EPEl ya está instalado"
		fi
		echo "Detectando ClamAV"
		Flag=$(yum list installed | grep clamav)
		if  [ -z "$Flag" ]; 
		then
			echo "Instalando ClamAV"
			yum -y install clamav clamav-devel
		else 
			echo "ClamAV ya está instalado "
		fi

		echo "presione enter para actualizar"
		read -p "presione cualquier tecla para cancelar" ack
		if [ -z "$ack" ];
		then
			echo "buscando actualizaciones"
			yum update
		else 
			echo "actualización cancelada"
		fi
fi

OS=$(hostnamectl | grep centos)
if [ -z "$OS" ];
then

	echo "El sistema es: "
	echo "$UNAME"
		echo "Detectando ClamAV"
		Flag=$(dpkg-query -l | grep clamav)
		if  (apt list clamav); 
		then
			echo "ClamAV ya está instalado "
		else 
			echo "Instalando ClamAV"
			apt-get install clamav clamav-daemon -y
		fi

		echo "presione enter para actualizar"
		read -p "presione cualquier tecla para cancelar" ack
		if  ("$ack" = ""); 
		then
			echo "buscando actualizaciones"
			sudo apt-get update
		else 
			echo "actualización cancelada"
		fi

fi 


exit