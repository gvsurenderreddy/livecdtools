#! /bin/bash
echo "MkRoot от wakoo"
if [ $USER != root ] ; then echo "Скрипт требует прав суперпользователя" && exit ; fi
rm -f excludes
find usr/portage/* var/log/* var/nullmailer/* run/openrc/* usr/src/* usr/share/doc/* usr/share/gtk-doc/* usr/tmp/* >> excludes
find var/cache/* | grep -v man >> excludes
find usr/share/icons/* | grep -v sovietec-os >> excludes
find usr/share/locale/* | egrep -v /'us|ru' >> excludes
echo "excludes" >> excludes
umount proc sys dev
mksquashfs . ../cdrom/x86_64/filesystem.squashfs -comp xz -ef excludes -noappend -no-recovery
