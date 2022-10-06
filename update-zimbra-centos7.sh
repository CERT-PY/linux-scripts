#! /bin/bash
yum clean metadata > /dev/null
yum check-update > /tmp/updates.txt
yum install -y zimbra-common-core-jar zimbra-common-core-libs zimbra-mbox-store-libs > /tmp/install_update.txt 
#runuser -l zimbra -c 'zmcontrol restart'
echo "Se requiere de su intervención, verifique si se han aplicado cambios en los paquetes en su servidor, es posible que los mismos requieran reiniciar los servicios"$(less /tmp/install_update.txt) | mail -vvv -s "Atencion" administrador@administrador.com
