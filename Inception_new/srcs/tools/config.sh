#!/bin/bash

# Changement de permission
mkdir -p /home/${USER}/data

# Vérifier si l'entrée existe déjà dans /etc/hosts
if grep -q "127.0.0.1 ${1}" /etc/hosts; then
	echo "L'entrée existe déjà dans /etc/hosts."
else
	# Ajouter l'entrée au fichier /etc/hosts
	echo "Ajout de l'entrée dans /etc/hosts."
	echo "127.0.0.1 ${1}" >> /etc/hosts
fi