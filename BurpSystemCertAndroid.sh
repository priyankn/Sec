#!/bin/sh

DIR="/data/local/tmp/cer/"
BURP_CERT=$1

mkdir -p -m 700 $DIR
cp -R /system/etc/security/cacerts/* $DIR
mount -t tmpfs tmpfs /system/etc/security/cacerts
mv $DIR/* /system/etc/security/cacerts/


#if[ -z "$BURP_CERT" ]
#then
#echo "Copying $BURP_CERT"
#cp $BURP_CERT /system/etc/security/cacerts/
#else
#echo "Nothing set, copying default"
cp /sdcard/9a5ba575.0 /system/etc/security/cacerts/
#fi

echo "[+] Setting up Permissions on the certs directory.."
chown root:root /system/etc/security/cacerts/*
chmod 644 /system/etc/security/cacerts/*
chcon u:object_r:system_file:s0 /system/etc/security/cacerts/*

echo "[+] All Done"

