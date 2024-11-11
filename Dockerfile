# Usa una imagen base de PHP con Apache
FROM php:8.0-apache

# Copia el archivo index.php al contenedor
COPY index.php /var/www/html/

# Asegura permisos y propiedad para Apache
RUN chmod -R 755 /var/www/html && chown -R www-data:www-data /var/www/html

# Configura Apache para permitir acceso al directorio raíz
RUN echo "<Directory /var/www/html/> \n\
    Options Indexes FollowSymLinks \n\
    AllowOverride All \n\
    Require all granted \n\
</Directory>" > /etc/apache2/conf-available/custom.conf && \
    a2enconf custom

# Expone el puerto 80
EXPOSE 80

# Inicia Apache en el primer plano
CMD ["apache2-foreground"]

