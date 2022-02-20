# 1. Apuntes de la clase:
rpm -qa
Enlista los paquetes instalados en el SO.

rpm -qi nombre_paquete
Mostrar la información sobre un paquete especifico.

Con Bash podemos hacer scripting en SO Linux.

rpm -qc nombre_paquete
Muestra todos los archivos involucrados sobre el paquete.

También podemos usar yum. Pero lo primero es dar yum update. Pero para poder ejecutarlo necesitamos un usuario con todos los permisos, por ejemplo el usuario root.

Si se muestra un # al final del nombre del usuario, eso indica que estamos trabajando con un usuario root. Por ejemplo:
[root@server ~]#

Lo ideal es nunca trabajar con un usuario root. Lo ideal es crear usuarios que tengan ciertos permisos específicos, por medidas de seguridad y evitar errores.

yum install net-tools
Para habilitar el ifconfig.

rpm -e nombre_paquete
Para eliminar un paquete del SO.


# 2. Apuntes de la clase:

• rpm -qa: ver todos los paquetes instalados
• rpm -qi bash: Consultar información del paquete bash
• rpm -qc bash: Ver configuración de bash
• sudo yum update: (desde usuario root) actualizar repositorios.
• yum-install net-tools: Este paquete incluye las herramientas importantes para controlar el subsistema de red del núcleo Linux. Esto incluye arp, ifconfig, netstat, rarp, nameif y route. Además, este paquete contiene utilidades relativas a tipos particulares de «hardware» de red (plipconfig, slattach, mii-tool) y aspectos avanzados de configuración IP (iptunnel, ipmaddr).
Recordar que se debe tener cuidado con el tipo de enlaces que se agregan a los repositorios.