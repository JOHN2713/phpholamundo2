# Usa una imagen base oficial de PHP con Apache
FROM php:8.0-apache

# Copia el archivo PHP en el contenedor
COPY app.php /var/www/html/

# Expone el puerto 80, que es el puerto predeterminado de Apache
EXPOSE 80

# Inicia el servidor Apache
CMD ["apache2-foreground"]
