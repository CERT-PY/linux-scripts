#! /bin/bash
var1="Nothing to do"
yum clean metadata
yum check-update zimbra*
yum install -y zimbra-common-core-jar zimbra-common-core-libs zimbra-mbox-store-libs > /tmp/install_update.txt
#runuser -l zimbra -c 'zmcontrol restart'
if [[ $(grep -c "Nothing to do\|Nada para hacer" /tmp/install_update.txt) = 0 ]]; then
	echo -e "Se requiere de su intervención, verifique si se han aplicado cambios en los paquetes en su servidor, es posible que los mismos requieran reiniciar los servicios\n\nDetalles:\n\n".$(</tmp/install_update.txt) | mail -s "Atencion" CuentaDeCorreo@Dominio
else
	echo /dev/null
fi
