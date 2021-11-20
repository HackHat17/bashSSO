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
echo "    	PIA-SSO"
echo "#########################"
echo "#########################"
echo " Eric Cordova	1617208"
echo ""
tput setaf 3;
echo "Detectando el sistema operativo"


#===============================================
#===============================================
# 					Zona Centos
#===============================================
#===============================================
OSNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
OS=$(hostnamectl | grep ubuntu)
if [ -z "$OS" ];
then

	echo ""
	echo ""
	tput setaf 2;
	echo "Sistema operativo detectado"
	tput sgr 0;
	echo "El sistema es: "
	echo "$OSNAME"
	echo ""
	echo ""

#===============================================
#===============================================
# 				Instalación EPEL
#===============================================
#===============================================



	Flag=$(yum list installed | grep epel)
	tput setaf 3;
	echo "Detectando paquete: EPEL"
	echo ""
	tput sgr 0;
		if [ -z "$Flag" ];
		then
			echo "Instalando paquete: EPEL"
			echo ""
			yum -y install epel-release
			tput setaf 2;
			echo "paquete instalado: EPEL "
			echo ""
			tput sgr 0;
		else 
			tput setaf 2;
			echo "El paquete ya está instalado: EPEL "
			echo ""
			tput sgr 0;
		fi


#===============================================
#===============================================
# 				Instalación ClamAV
#===============================================
#===============================================
		tput setaf 3;
		echo "Detectando paquete: ClamAV"
		echo ""
		tput sgr 0;
		Flag=$(yum list installed | grep clamav)
		if  [ -z "$Flag" ]; 
		then
			echo "Instalando paquete: ClamAV"
			echo ""
			yum -y install clamav clamav-devel
			tput setaf 2;
			echo "Paquete instalado: ClamAV"
			echo ""
			tput sgr 0;
		else 
			tput setaf 2;
			echo "El paquete ya está instalado: ClamAV "
			echo ""
			tput sgr 0;
		fi


#===============================================
#===============================================
# 					Actualización
#===============================================
#===============================================




		echo "presione enter para actualizar"
		read -p "presione cualquier tecla para cancelar: " ack
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
if [ -z "$OS" ];
then

	echo ""
	echo ""
	tput setaf 2;
	echo "Sistema operativo detectado"
	tput sgr 0;
	echo "El sistema es: "
	echo "$OSNAME"

#===============================================
#===============================================
# 				Instalación ClamAV
#===============================================
#===============================================


		tput setaf 3;
		echo "Detectando paquete: ClamAV"
		echo ""
		echo ""
		tput sgr 0;
		if  (apt list clamav); 
		then
			echo "Instalando paquete: ClamAV"
			echo ""
			apt-get install clamav clamav-daemon -y
		else 
			tput setaf 2;
			echo "El paquete ya está instalado: ClamAV"
			echo ""
			tput sgr 0;
		fi

#===============================================
#===============================================
# 					Actualización
#===============================================
#===============================================
			echo ""
			echo "buscando actualizaciones"
			apt-get update && apt-get upgrade -y

fi 


exit