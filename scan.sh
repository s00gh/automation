#!/bin/bash

#store all URLs into "url.txt" file first
urls=$(cat urls.txt)
for url in $urls; do
	echo "########################## -------NMAP SCAN FOR $url -------------- #########################"
        nmap $url | grep "open"
	echo "######################### DIRSEARCH FOR $url #########################"
	dirsearch -u https://$url | awk '$2 == "403" {print}'
done
