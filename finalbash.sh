#! /bin/bash
#===============================================
#===============================================
# 					Zona de impresión
#===============================================
#===============================================
tput sgr 0;
tput setaf 1;
echo "#########################"
echo "#########################"
echo "### 		PIA-SSO		###"
echo "#########################"
echo "#########################"
echo "Eric Cordova		1617208"
echo ""
tput setaf 3;
echo "Detectando el sistema operativo"


#===============================================
#===============================================
# 					Zona Centos
#===============================================
#===============================================
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
OS=$(hostnamectl | grep ubuntu)
if [[ -z "$OS" ]];
then

	echo ""
	echo ""
	tput setaf 2;
	echo "Sistema operativo detectado"
	tput sgr 0;
	echo "El sistema es: "
	echo "$UNAME"

#===============================================
#===============================================
# 				Instalación EPEL
#===============================================
#===============================================



	Flag=$(yum list installed | grep epel)
		if [[ -z "$Flag" ]];
		then
			echo "Instalando EPEL"
			yum -y install epel-release
			echo "EPEL instalado"
		else 
			echo "EPEl ya está instalado"
		fi


#===============================================
#===============================================
# 				Instalación ClamAV
#===============================================
#===============================================
		echo "Detectando ClamAV"
		Flag=$(yum list installed | grep clamav)
		if  [[ -z "$Flag" ]]; 
		then
			echo "Instalando ClamAV"
			yum -y install clamav clamav-devel
		else 
			echo "ClamAV ya está instalado "
		fi


#===============================================
#===============================================
# 					Actualización
#===============================================
#===============================================




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


#===============================================
#===============================================
# 					Zona Ubuntu
#===============================================
#===============================================


OS=$(hostnamectl | grep centos)
if [[ -z "$OS" ]];
then

	echo ""
	echo ""
	tput setaf 2;
	echo "Sistema operativo detectado"
	tput sgr 0;
	echo "El sistema es: "
	echo "$UNAME"

#===============================================
#===============================================
# 				Instalación ClamAV
#===============================================
#===============================================


		echo "Detectando ClamAV"
		echo ""
		echo ""

		Flag=$(dpkg-query -l | grep clamav)
		if  [[ -z "$Flag" ]]; 
		then
			echo "Instalando ClamAV"
			echo ""
			apt-get install clamav clamav-daemon -y
		else 
			echo "ClamAV ya está instalado "
			echo ""
		fi

#===============================================
#===============================================
# 					Actualización
#===============================================
#===============================================


		echo "presione enter para actualizar"
		echo ""
		read -p "presione cualquier otra tecla para cancelar :" ack
		if [[ -z "$ack" ]];
		then
			echo "buscando actualizaciones"
			apt-get update && apt-get upgrade -y
		else 
			echo "actualización cancelada"
		fi

fi 


exit