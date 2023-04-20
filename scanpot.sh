#!/bin/bash

#store all URLs into "urlpot.txt" file first
urls=$(cat urlpot.txt)
for url in $urls; do
        echo "########## ---------- NMAP SCAN FOR $url ---------- ##########"
        nmap $url -Pn | grep "open"
        echo "########## ---------- TESTSSL FOR $url ---------- ##########"
	/home/kali/testscript/testssl.sh/testssl.sh $url | grep "potentially"
	echo "########## ---------- NUCLEI FOR $url ---------- ##########"
	nuclei -u $url
done
