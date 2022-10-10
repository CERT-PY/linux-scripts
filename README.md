Este script fue realizado con el único proposito de automatizar la tarea repetitiva de actualizar un servidor linux centos que ejecute el servicio de correo zimbra
Utilice el mismo bajo su propia responsabilidad

Requerimientos
Actualmente funciona en CentOS7

La finalidad del script es agregarlo a una tarea programada linux para que se ejecute periódicamente, para ello puede insertar una nueva línea dentro del archivo de linux crontab

Funcionamiento

El script funciona ejecutando los comandos básicos para instalar parches de seguridad en el servidor de correo zimbra, únicamente actualiza las dependenciaes de zimbra no cubre las actualizaciones de seguridad del sistema operativo
El script instala todas las dependencias y paquetes para zimbra, luego instalarlos reinicia los servicios de zimbra, lo cual causa una interrupción del servicio de correos
Si, se han realizado actualizaciones, el script envía un correo de alerta a la cuenta que se haya seteado en dentro del script, notificando que se han aplicado cambios y los detalles correspondientes
Si, el script se ejecuta y no hay cambios o parches que aplicar, no se envía ningún correo electrónico y el script se detiene
