#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
OS=$(hostnamectl | grep centos)

if [[ -z "$OS" ]];
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

		echo "presione enter para actualizar"
		read -p "presione cualquier tecla para cancelar" ack
		if [[ -z "$ack" ]];
		then
			echo "buscando actualizaciones"
			yum update
		else 
			echo "actualización cancelada"
		fi
fi
exit