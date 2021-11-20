#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
if ( $UNAME = 'CentOS Linux' )
then
	echo "$UNAME"
	echo "Instalando EPEL"
	yum -y install epel-release
	echo "EPEL instalado"
	#condicion para revisar si está instalado clamav, si no instalarlo
	echo "Detectando ClamAV"
	CLAMAV=$(yum list installed | grep clamav)
	echo "$CLAMAV" 
	if  (yum list -q installed clamav) 
	then
		echo "Instalando ClamAV"
		yum -y install clamav clamav-devel
	fi
#yum update
echo "fin del script"
fi

exit