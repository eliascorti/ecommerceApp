Instrucciones para Ejecutar la Página Web Localmente

Antes de ejecutar la página web localmente, asegúrate de cumplir con los siguientes requisitos:

PHP: Se requiere una versión igual o superior a 8.1.0. Verifica tu versión de PHP antes de continuar.
Configuración de PHP
Encuentra el archivo php.ini: Ubica la carpeta donde está instalado PHP en tu sistema y busca el archivo php.ini. Ábrelo en un editor de texto.

Habilita la extensión mysqli:
Busca la línea que comienza con extension=mysqli.
Asegúrate de que esta línea esté descomentada (sin punto y coma al principio). Si está comentada, elimina el punto y coma para descomentarla.
Si no encuentras esta línea, agrégala manualmente: extension=mysqli.
Reinicia el Servidor Web
Si estás utilizando Apache, reinicia el servidor Apache para aplicar los cambios en la configuración de PHP.
Notas Importantes
En caso de que surja algún error relacionado con MySQL, asegúrate de tener instalada una versión más reciente de MySQL.
¡Listo! Ahora estás listo para ejecutar la página web localmente. Si encuentras algún problema durante el proceso, no dudes en contactar al equipo de soporte técnico.

--------------------------------------------------------------------------------------------------------------------------------------------
Windows

Abre la carpeta del proyecto.
Haz doble clic en el archivo run.bat. Esto abrirá una ventana de terminal y comenzará el servidor PHP.
Copia la siguiente URL: http://localhost:3000.
Abre tu navegador web preferido.
Pega la URL copiada en la barra de direcciones del navegador y presiona Enter.
La página web debería cargarse en tu navegador.
--------------------------------------------------------------------------------------------------------------------------------------------
Linux

Abre una terminal nueva y dirigete hacia el directorio principal del proyecto. Ej:cd Escritorio/ecommerceApp
En la terminal, ejecuta el siguiente comando para dar permisos de ejecución al script: chmod +x run.sh
Para ejecutar el script, ingresa ./run.sh en la terminal y presiona Enter.
Sigue las instrucciones que se muestran en la terminal para copiar la URL del servidor local (por lo general, http://localhost:3000).
Abre tu navegador web preferido.
Pega la URL del servidor local en la barra de direcciones del navegador y presiona Enter.
La página web debería cargarse en tu navegador.
--------------------------------------------------------------------------------------------------------------------------------------------
macOS

Abre la carpeta del proyecto.
Haz doble clic en el archivo run.sh. Esto abrirá una terminal y comenzará el servidor PHP.
Sigue las instrucciones que se muestran en la terminal para copiar la URL del servidor local (por lo general, http://localhost:3000).
Abre tu navegador web preferido.
Pega la URL del servidor local en la barra de direcciones del navegador y presiona Enter.
La página web debería cargarse en tu navegador.
--------------------------------------------------------------------------------------------------------------------------------------------