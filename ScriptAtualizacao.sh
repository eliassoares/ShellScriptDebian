#!/bin/bash

echo "Atualizando e limpando o sistema:"
	apt-get update
	apt-get upgrade
	apt-get install upgrade-system
	apt-get -f install
	apt-get clean
	apt-get autoremove --purge
	apt-get autoclean
	apt-get -f remove

echo "Atualizando o Flash Plugin."
	update-flashplugin-nonfree --install

echo "Reiniciando o Sistema."
	reboot