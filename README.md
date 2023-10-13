Setup de l'image:
-Download l'image
-Checker le checksum
-Copier la conf wpa, le fichier ssh, et la conf de l'user dans la partition boot

--> a la mano, trouver l'adresse du rpi et la fixer dans la config de la box

Setup du pi:
-Setup le key only ssh config
-Update le pi
-Forcer sudo à utiliser un passwd
-Setup un firewall
-Setup fail2ban

-Monter un disque dur pour stocker tout le bordel qu'on va mettre

-Setup un reverse proxy

-Setup Home Assistant

-Recuperer un certificat ssl:
    Impossible de recup automatiquement via certbot pour la generation du cert. Du coup les commandes a faire a la main :
        sudo certbot -v certonly \
        --dns-ovh \
        --dns-ovh-credentials /etc/ovh.ini \
        --dns-ovh-propagation-seconds 60 \
        -d *.yanck.ovh
        