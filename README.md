Setup de la machine:
-Setup le key only ssh config
-Update le pi
-Forcer sudo à utiliser un passwd
-Donner une ip static
-Vérifier les chemin en dur a droite a gauche
-Setup des DNS pour rediriger au bon endroit. Aujourdh'ui il n'y a pas de dyndns

Lancer les script ansible, en premier le setup rpi

-Recuperer un certificat ssl:
    Impossible de recup automatiquement via certbot pour la generation du cert. Du coup les commandes a faire a la main :
        sudo certbot -v certonly \
        --dns-ovh \
        --dns-ovh-credentials /etc/ovh.ini \
        --dns-ovh-propagation-seconds 60 \
        -d *.yanck.ovh
        
Se connecter a ProtonDrive via rclone
Setup nut --> a automatiser, surtout de la copie de fichiers. Tester NUT 
Test
