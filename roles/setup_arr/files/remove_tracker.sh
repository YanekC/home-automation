#!/bin/bash

QBITTORRENT_ADDR='http://localhost:8080/api/v2'
TORRENT_HASH="$1"
PASSWD="admin:adminadmin"

#https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-4.1)
SID="$(curl -s -i --data 'username=admin&password=adminadmin' "$QBITTORRENT_ADDR/auth/login" | grep -oP '(?<=SID=)[^;]+')"
while [[ 1 -gt "$(curl -s --cookie "SID=$SID" "$QBITTORRENT_ADDR/torrents/properties?hash=$TORRENT_HASH" | jq .total_downloaded)" ]]; do
   sleep 5
done

urls=""
for url in $(curl -s --cookie "SID=$SID" "$QBITTORRENT_ADDR/torrents/trackers?hash=$TORRENT_HASH" | jq -r '.[] | select(.url | startswith("http")) | .url ') ; do
 urls+="$url|"
done
echo $urls
curl -vv --cookie "SID=$SID" "$QBITTORRENT_ADDR/torrents/removeTrackers" --data "hash=$TORRENT_HASH&urls=$urls"