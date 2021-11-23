!/bin/bash

myfile="/var/www/html/donowtik.com/cam.jpg"
mygallery="/var/www/html/donowtik.com/gallery/"
mydir="/var/www/html/donowtik.com/"
/usr/bin/raspistill -sh 50 -co 50 -hf -vf -sa -100 -o /var/www/html/donowtik.com/cam.jpg
#raspistill -sh 50 -co 50 -vf -sa -100 -o a.jpg
date >> /root/logrottingapple

for ((i=30;i>=1;i--)); do
 #echo $i
 ii=$((i+1))
 #echo -----$ii
 mv $mygallery/apple$i.jpg $mygallery/apple$ii.jpg
done 


checksum=$(sha256sum $mygallery/apple2.jpg | awk '{print $1}')
picnumber=$(cat $mygallery/counter.html)
picnumber=$((picnumber+1))
created=$(date +%H%M%S)
datecreated=$(date +%Y%m%d)
#datecr=$(date +%Y%m%d%H)
datec=$(date +%Y%m%d%H%M)
fname=$datec.jpg
exiftool -overwrite_original  \
-iptc:By-Line="Infolab Franz Xaver" \
-iptc:CopyrightNotice="Infolab Franz Xaver" \
-iptc:ObjectName="Rotting Apple" \
-iptc:Credit="Bildrecht.at" \
-iptc:Keywords="Art, process art, Rotting Apple, Infolab, Media Art" \
-iptc:SpecialInstructions="published" \
-iptc:EditStatus="$checksum" \
-iptc:City="Eferding" \
-iptc:OriginalTransmissionReference="$picnumber" \
-iptc:TimeCreated="$created" \
-iptc:DateCreated="$datecreated" \
-iptc:Caption-Abstract="The Pics are generated in context of process art. A apple is rotting since 1993. During daytime we taking a picture of the apple e
-iptc:Headline="Infolab" $myfile

exiftool $myfile > $mydir/exifentries.txt

new_entry=$(cat /tmp/data2.txt)
if [[ $new_entry != "" ]]; then
   exiftool -q -overwrite_original -iptc:Caption-Abstract="$new_entry" /var/www/html/donowtik.com/cam.jpg
   rm /tmp/data2.txt
fi

Keine geänderten Dateien, daher keine Aktualisierung notwendig.
Sie haben neue Post in /var/mail/root.
root@tns:/home/pi# cat /root/cronscripts/rotting_apple.sh
#!/bin/bash

myfile="/var/www/html/donowtik.com/cam.jpg"
mygallery="/var/www/html/donowtik.com/gallery/"
mydir="/var/www/html/donowtik.com/"
/usr/bin/raspistill -sh 50 -co 50 -hf -vf -sa -100 -o /var/www/html/donowtik.com/cam.jpg
#raspistill -sh 50 -co 50 -vf -sa -100 -o a.jpg
date >> /root/logrottingapple

for ((i=30;i>=1;i--)); do
 #echo $i
 ii=$((i+1))
 #echo -----$ii
 mv $mygallery/apple$i.jpg $mygallery/apple$ii.jpg
done 


checksum=$(sha256sum $mygallery/apple2.jpg | awk '{print $1}')
picnumber=$(cat $mygallery/counter.html)
picnumber=$((picnumber+1))
created=$(date +%H%M%S)
datecreated=$(date +%Y%m%d)
#datecr=$(date +%Y%m%d%H)
datec=$(date +%Y%m%d%H%M)
fname=$datec.jpg
exiftool -overwrite_original  \
-iptc:By-Line="Infolab Franz Xaver" \
-iptc:CopyrightNotice="Infolab Franz Xaver" \
-iptc:ObjectName="Rotting Apple" \
-iptc:Credit="Bildrecht.at" \
-iptc:Keywords="Art, process art, Rotting Apple, Infolab, Media Art" \
-iptc:SpecialInstructions="published" \
-iptc:EditStatus="$checksum" \
-iptc:City="Eferding" \
-iptc:OriginalTransmissionReference="$picnumber" \
-iptc:TimeCreated="$created" \
-iptc:DateCreated="$datecreated" \
-iptc:Caption-Abstract="The Pics are generated in context of process art. A apple is rotting since 1993. During daytime we taking a picture of the apple every hour. This image are unique, because the picture has a serial number amd we sign it by a sha256 checksum. You can find the checksum in EditStatus of the previous picture and the serial number of the image in Original Tranmission Referenz. CONTRACT: The artist who made this artwork and this photograph transfers hereby all rights and resale rights to the new unknown owner. This is a contract signed by the public key of the artist. The price of this picture is fixed at 0,0 Euro. The new owner confirms the ownership of this picture with this submiting this metatag. The new Owner is .....(insert our name, change text, contract url https://donowtik.com/contract.html  - feel free: delete or add test. Total 6000 max Character)" \
-iptc:Headline="Infolab" $myfile

exiftool $myfile > $mydir/exifentries.txt

new_entry=$(cat /tmp/data2.txt)
if [[ $new_entry != "" ]]; then
   exiftool -q -overwrite_original -iptc:Caption-Abstract="$new_entry" /var/www/html/donowtik.com/cam.jpg
   rm /tmp/data2.txt
fi

#exiftool -overwrite_original  -iptc:By-Line="Franz Xaver" $myfile
cp $myfile $mygallery/apple1.jpg
cp $myfile $mydir/allpics/$fname
cp $myfile /media/bkup/bkup_donowtik.at/rottingapple/allpics/$fname
echo -n $checksum >> $mygallery/codes.html
echo " " $picnumber " " "<a href='https://donowtik.com/allpics/slide_$datec.html'>$datec</a>" >> $mygallery/codes.html
#echo -n $picnumber >> $mygallery/codes.html
#echo -n " " >> $mygallery/codes.html
#echo $datecr >> $mygallery/codes.html
echo $picnumber> $mygallery/counter.html


cd $mygallery
convert $mydir/cam.jpg -resize 40% $mydir/cam_scaled.jpg

#sudo llgal --tx 200 --ty 200 --sy 700  --gc --cc --cf --ct -R --exif --fe -f -L --li --title Pics by fx  --www
sudo llgal --tx 200 --ty 200 --sy 700 --cc --cf --ct -R --exif --fe -f -L --li --title Pics by fx  --www
#ls -al /var/www/html/donautix.com/gallery/ 

cd $mydir/allpics/

sudo llgal --tx 200 --ty 200 --sy 700  --gc --cc --cf --ct -R --exif -n --fe -f -L --li --title Pics by fx  --www
sudo llgal --tx 200 --ty 200 --sy 700 --cc --cf --ct -R --exif --fe -n -f -L --li --title Pics by fx  --www
