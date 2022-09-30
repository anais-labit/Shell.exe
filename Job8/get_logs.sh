#!/bin/bash

#definir variables
file="number_connection-$(date +%d-%m-%Y-%H:%M)"

#récupérer connexions session, compter le nb de lignes 
#et envoyer l'output dans un fichier dont la date/heure change
grep "gdm-password]: pam_unix(gdm-password:session):" /var/log/auth.log | wc -l > $file

#créer un dossier Backup s'il n'existe pas déjà (-p)
mkdir -p /home/anais/bin/Shell.exe/Job8/Backup/

#archiver le fichier en lui donnant le nom de son paramètre1 
#et l'envoyer dans Backup
tar -cf /home/anais/bin/Shell.exe/Job8/Backup/$file.tar $file 

#supprimer les fichiers textes inutiles
rm $file