#! /bin/bash
echo "Su versión actual de zimbra es:"$(runuser -l zimbra -c 'zmcontrol -v')
yum clean metadata > /dev/null
echo "Limpiando Metadata"
yum check-update > /tmp/updates.txt
echo "Verificando Repositorios"
#less /tmp/updates.txt | mail -vvv -s "Updates" mcenturion@cert.gov.py
echo "Actualizando dependencias de Zimbra"
yum install -y zimbra-common-core-jar zimbra-common-core-libs zimbra-mbox-store-libs > /tmp/install_update.txt 
#runuser -l zimbra -c 'zmcontrol restart'
echo "Se requiere de su intervención para aplicar el reinicio del servicio de zimbra\n"$(less /tmp/install_update.txt) | mail -vvv -s "Atencion" administrador@administrador.com
