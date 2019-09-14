#!/bin/bash
# Script Solemne 1 - Hugo Cuellar
# Administracion Usuarios
# Comienzo - Menu - Seleccion Numero
clear
echo "Ingrese el numero del item a seleccionar del menu"
echo "1 : Crear Usuario."
echo "2 : Eliminar usuario."
echo "3 : Crear grupo."
echo "4 : Agregar a usuario a Grupo"
echo "5 : Eliminar usuario de Grupo"
echo "6 : Salir."
read numero
clear
# Seleccion Numero 1 - Crear Usuario
if [ $numero = 1 ];
	then
	echo "Ingrese nombre de usuario."
	read usuario1
	echo "¿Desea agregar usuario a grupo especifico? Y/n"
	read confirmacion1
	if [ $confirmacion1 = Y ]
		then
		echo "Ingrese nombre de grupo secundario."
		read secundario
		echo "Ingrese nombre de grupo primario."
		read primario
		echo "El nombre de grupo secundario es $secundario y primario $primario ¿esta seguro? S/n"
		read seguro1
		if [ $seguro1 = S ]
			then
			groupadd $primario
			groupadd $secundario
			useradd $usuario1 -G $primario -g $secundario
			echo "Se completo la operacion"
			exit
		else [ $seguro1 = n ]
			echo "Operacion grupo y usuario anulada, hasta luego"
			exit
		fi
	else [ $confirmacion1 = n ]
		echo "No se agregará el usuario a grupo especificos ¿Esta seguro? Ok/no"
		read confirmacion2
		if [ $confirmacion2 = Ok ]
			then
			useradd $usuario1
			echo "Se creo el usuario $usuario1"
			exit
		else [ $confirmacion2 = no ]
			echo "Operacion de creacion usuario anulada, hasta luego"
			exit
		fi
	fi
fi
# Seleccion Numero 2 - Eliminar usuario
if [ $numero = 2 ]
	then
	echo "Ingrese nombre de usuario a eliminar."
	read eliminar_usuario
	echo "¿Desea eliminar el usuario $eliminar_usuario ? Y/n"
	read confirmacion3
	if [ $confirmacion3 = Y ]
		then
		userdel $eliminar_usuario
		echo "El usuario $eliminar_usuario ha sido eliminado"
	else [ $confirmacion3 = n ]
		echo "Operacion de eliminacion usuario cancelada"
	fi
fi
# Seleccion Numero 3 - Crear grupo
if [ $numero = 3 ]
	then
	echo "Ingrese nombre de grupo a crear"
	read creacion_grupo
	echo "¿Desea crear el grupo $creacion_grupo ? Y/n"
	read confirmacion4
	if [ $confirmacion4 = Y ]
		then
		groupadd $creacion_grupo
		echo "Se ha creado el grupo $creacion_grupo "
	else [ $confirmacion4 = n ]
		echo "Operacion de creacion grupo cancelada"
	fi
fi
# Seleccion Numero 4 - Agregar a usuario a Grupo
if [ $numero = 4 ]
	then
	echo "Mensaje de prueba"
	exit
fi
# Seleccion Numero 5 - Eliminar usuario de Grupo
if [ $numero = 5 ]
	then
	echo "Ingrese nombre de usuario"
	read usuario0
	echo "Ingrese nombre de grupo"
	read grupo0
	echo "¿Esta seguro de eliminar el usuario $usuario0 del grupo $grupo0 ? Y/n"
	read confirmacion0
	if [ $confirmacion0 = Y ]
		then
		gpasswd -d $usuario0 $grupo0
		echo "Usuario $usuario0 ha sido removido del grupo $grupo0 "
	else [ $confirmacion = n ]
		echo "El usuario $usuario0 no fue removido del grupo $grupo0 "
		exit
	fi
fi
# Seleccion Numero 6 - Salir
if [ $numero = 6 ]
	then
	echo "Hasta luego, gracias por usar el script"
	exit
fi
