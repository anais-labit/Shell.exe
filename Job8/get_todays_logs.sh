
#CETTE DEUXIÈME VERSION PERMET D'ARCHIVER LES CONNEXIONS DU JOUR
#CE QUI SEMBLE PLUS UTILE QUE DE COMPILER TOUS LES LOGS DEPUIS 
#LE DÉBUT DE L'UTILISATION DU PC 
#ICI, LE CRONTAB EST PROGRAMMÉ UNE FOIS PAR JOUR (à 05h00)

# définir les variables
TODAY=$(date "+%d")
FILE=("number_todays_connection-$(date +"%d-%m-%Y-%H:%M")")

#récupérer connexions anais
last | grep anais > anais_logs

#récupérer connexions du jour
grep $TODAY anais_logs | wc -l > $FILE

#créer un dossier Backup s'il n'existe pas déjà (-p)
mkdir -p /home/anais/bin/Shell.exe/Job8/Backup/

#archiver le fichier en lui donnant le nom de son paramètre1 
#et l'envoyer dans Backup
tar -cf /home/anais/bin/Shell.exe/Job8/Backup/$FILE.tar $FILE

#supprimer les fichiers textes inutiles
rm $FILE
rm anais_logs



# Pour programmer un job, j'ai édité le fichier crontab (crontab -e) et y ai ajouté une nouvelle expression. 
# La syntaxe d’une expression peut être divisée en deux étapes : le programme et la commande à lancer. 
# Cette dernière peut également être un script si on indique son chemin. 
#
# J'ai donc écrit :
# 39 * * * * /bin/bash /home/anais/bin/Shell.exe/Job8/get_todays_logs.sh >/dev/null 2>&1
# POur que chaque 39ème minute, de chaque heure, de chaque jour, de chaque mois, de chaque année, 
# le script bash get_todays_logs.sh se lance via son chemin absolu (home/anais/bin/Shell.exe/Job8). 
