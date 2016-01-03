#! /bin/bash
echo "MkCdrom от wakoo"
echo ": 1/4 немного прибираемся"
rm -f cdrom.iso cdrom/checksum.sha512 cdrom/buildtime cdrom/checksum.sha256 cdrom/checksum.md5
touch cdrom/livecd
cd cdrom
echo ": 2/4 запись даты"
env LANG=C date | head -n 1 > buildtime
echo ": 3/4 вычисление контрольных сумм"
sha512sum -b `find -type f | grep -v checksum` > checksum.sha512
sha256sum -b `find -type f | grep -v checksum` > checksum.sha256
md5sum -b `find -type f | grep -v checksum` > checksum.md5
echo ": 4/4 создание образа CD-ROM"
xorriso -dev ../cdrom.iso -add . -- -volid "wakooGentoo" -joliet on -publisher wakoo -boot_image isolinux dir=isolinux
cd ..
