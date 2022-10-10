#! /bin/bash
#Esta línea limpia los enl
yum clean metadata
#Esta línea actualiza los enlaces de los repositorios locales
yum check-update zimbra*
#Esta línea instala todos los componenetes del servicio de Zimbra, si esta existe una actualización para un paquete, característica de Zimbra, esta línea la instala de nuevo en el servidor, al final de su ejecución reinicia los servicios del servidor de correos, deteniendo el servicio,  por lo cual puede domrarse su ejecución, enviando la salida del comando a un archivo de texto, ubicadado en la carpeta tmp
yum install -y zimbra* > /tmp/install_update.txt
#Esta línea verifica si, se han instalado actualizaciones para el servidor de correo, verificando la salida del archivo de texto ubicado en la carpeta tmp, evalúa si en la salida se ha escrito la cadena de etexto "" si no encuentra coincidencia con la cadena de texto, el programa envía un correo a una cuenta específica para el dominio sobre el cual opera el servidor de correo con la salida del archivo "install_updates.txt"
if [[ $(grep -c "Nothing to do\|Nada para hacer" /tmp/install_update.txt) = 0 ]]; then
        { echo "Subject: Atencion" | echo "Se requiere de su intervención, verifique si se han aplicado cambios en los paquetes en su servidor, es posible que los mismos requieran reiniciar los servicios\n\nDetalles:\n\n".$(</tmp/install_update.txt) | /opt/zimbra/common/sbin/sendmail -v xxx@foo.com }
else
        echo /dev/null
fi
