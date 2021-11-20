#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
echo "if de centos"
if [ $UNAME == '"CentOS Linux"' ]
then
    echo "if de centos true"
	echo "Instalando EPEL"
	yum -y install epel-release
	echo "EPEL instalado"
	#condicion para revisar si está instalado clamav, si no instalarlo
	echo "Detectando ClamAV"
	if  [ yum list -q installed clamav ] 
	then
		echo "Instalando ClamAV"
		yum -y install clamav clamav-devel
	fi
#yum update
fi
echo "if de centos false"
echo "if de ubuntu"
if [ $UNAME == '"Ubuntu"' ]
then
    echo "if de ubuntu true"
    echo "$UNAME"
	echo "Detectando ClamAV"
	CLAMAV=$(which clamav)
	echo "$CLAMAV"
	
	if  [ -z "$CLAMAV" ] 
	then
		echo "Instalando ClamAV"
		#apt install clamav
	fi
	echo "actualizando"
    #apt-get update
fi

echo "fin del script"
exit