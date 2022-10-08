#!/bin/bash

# tant qu'il reste des lignes à parcourir, assigner des valeurs aux champs repérés (séparés par des virgules) :
while IFS="," read -r Id Prenom Nom Mdp Role

do
    # créer utilisateurs
        # si admin, superutilisateur :
        if [ ${Role:0:5} = "Admin" ]; then 
            useradd --password $Mdp --badnames $Prenom 
            usermod -aG sudo $Prenom

        #sinon, utilisateur normal :
        else 
            useradd --password $Mdp --badnames $Prenom 

        fi        

echo "Editing user $Prenom ..." ; echo "Done."

done</home/anais/Downloads/Shell_Userlist.csv


# # DÉCOMMENTER POUR EFFACER TOUS LES UTILISATEURS CRÉÉS :

# #!/bin/bash

# # tant qu'il reste des lignes à parcourir :
# while IFS="," read -r Id Prenom Nom Mdp Role
# do
#    deluser $Prenom
   
# done</home/anais/Downloads/Shell_Userlist.csv