#! /bin/bash
#identifica OS
echo "Detectando SO"
UNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#imprimir OS
echo "El sistema es: "
echo "$UNAME"
#condicional de SO
echo "Instalando EPEL"
yum -y install epel-release
echo "EPEL instalado"
#condicion para revisar si está instalado clamav, si no instalarlo
echo "Detectando ClamAV"
if  [yum list installed | grep clamav = ""]; then 
	echo "Instalando ClamAV"
	yum -y install clamav clamav-devel
	else
	echo "clamAV ya se encuentra instalado"
	fi
fi
yum update
echo "fin del script"
exit