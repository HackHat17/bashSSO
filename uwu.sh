#! /bin/bash
#identifica OS
	echo "El sistema es: "
	echo "$UNAME"
		echo "Detectando ClamAV"
		Flag=$(dpkg-query -l | grep clamav)
		if  ( -z "$Flag" ); 
		then
			echo "Instalando ClamAV"
			apt-get install clamav clamav-daemon -y
		else 
			echo "ClamAV ya está instalado "
		fi

		echo "presione enter para actualizar"
		read -p "presione cualquier tecla para cancelar" ack
		if ( -z "$ack" );
		then
			echo "buscando actualizaciones"
			apt-get update && apt-get upgrade -y
		else 
			echo "actualización cancelada"
		fi