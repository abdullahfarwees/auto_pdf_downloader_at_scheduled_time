#!/bin/bash
# Give the  url

rm links.txt
sleep 1
# fetch PDF URL from a capitolhillbaptist.
lynx --dump www.capitolhillbaptist.org | awk '/http/{print $2}' | grep pdf  >> links.txt

echo link.txt generated

sleep 1
#prepare file for PDF download
awk "NR != `wc -l < links.txt`" links.txt > temp_link.txt

sleep 1
# download PDFs
for i in $( cat temp_link.txt ); do wget $i; done

rm links.txt
rm temp_link.txt

echo work completed 
exit 0


