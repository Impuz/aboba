#!/bin/bash
#Госуслуги
echo '*************************************************************'
echo 'Установка плагина для работы с порталом государственных услуг'
echo '*************************************************************'
if [ $(id -u) != 0 ]; then
    echo "Необходимо запустить от имени Администратора"
    exit 1
fi
wget https://cryptopro.ru/sites/default/files/products/cades/current_release_2_0/cades-linux-amd64.tar.gz
tar -xzvf cades-linux-amd64.tar.gz
apt-get -y install ./cades-linux-amd64/cprocsp-pki-{cades,plugin}-*.rpm

#wget https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-i386.rpm
#apt-get install -y ./IFCPlugin-i386.rpm
wget https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x86_64.rpm
apt-get -y install ./IFCPlugin-x86_64.rpm
wget https://www.cryptopro.ru/sites/default/files/public/faq/ifcx64.cfg
yes | cp ifcx64.cfg /etc/ifc.cfg

mkdir /etc/chromium/native-messaging-hosts
ln -s /etc/opt/chrome/native-messaging-hosts/ru.rtlabs.ifcplugin.json /etc/chromium/native-messaging-hosts/
ln -s /opt/cprocsp/lib/amd64/libcppkcs11.so.4.0.4 /usr/lib/mozilla/plugins/lib/libcppkcs11.so
