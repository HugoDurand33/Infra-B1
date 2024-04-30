#!/bin/bash

# Demande à l'utilisateur de saisir le nom du jeu
echo "Entrez le nom du jeu (minecraft ou rust):"
read game_name

# Vérifie si le nom du jeu est minecraft ou rust
if [ "$game_name" = "minecraft" ] || [ "$game_name" = "rust" ]; then
    # Copie le dossier base vers le dossier spécifique du jeu
    cp -r /home/ubuntu/base-servers/$game_name /home/ubuntu/servers/$game_name
    
    # Demande à l'utilisateur de nommer le nouveau dossier
    echo "Entrez un nom pour le nouveau dossier:"
    read folder_name
    
    # Renomme le dossier copié avec le nom fourni par l'utilisateur
    mv /home/ubuntu/servers/$game_name /home/ubuntu/servers/$folder_name
    
    # Si le jeu est Minecraft, demande un port et met à jour le fichier server.properties
    if [ "$game_name" = "minecraft" ]; then
        echo "Entrez le numéro de port pour le serveur Minecraft:"
        read minecraft_port
        
        # Assurez-vous que le dossier existe et que le fichier server.properties est là
        if [ -f "/home/ubuntu/servers/$folder_name/server.properties" ]; then
            # Met à jour le numéro de port dans le fichier server.properties
            sed -i "s/server-port=.*/server-port=$minecraft_port/" /home/ubuntu/servers/$folder_name/server.properties
            echo "Le port du serveur Minecraft a été mis à jour avec succès à $minecraft_port."
        else
            echo "Le fichier server.properties n'a pas été trouvé. Assurez-vous que le chemin est correct."
        fi
    fi

    echo "Le dossier a été copié et renommé en $folder_name avec succès."
else
    echo "Nom de jeu non reconnu. S'il vous plaît, entrez 'minecraft' ou 'rust'."
fi