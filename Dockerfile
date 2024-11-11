# Usa una imagen base oficial de PHP con Apache
FROM php:8.0-apache

# Copia el archivo PHP en el contenedor
COPY index.php /var/www/html/

# Asegura que los permisos del archivo y la carpeta sean correctos
RUN chmod -R 755 /var/www/html

# Habilita PHP en Apache
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Expone el puerto 80, que es el puerto predeterminado de Apache
EXPOSE 80

# Inicia el servidor Apache
CMD ["apache2-foreground"]
