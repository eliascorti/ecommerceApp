# Usa una imagen base de PHP
FROM php:8.0-cli

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Instala Composer (si usas Composer para gestionar dependencias)
RUN apt-get update && \
    apt-get install -y unzip git && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Instala las dependencias de PHP
RUN composer install

# Expone el puerto en el que el servidor PHP escuchará
EXPOSE 10000

# Comando para iniciar el servidor PHP
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
