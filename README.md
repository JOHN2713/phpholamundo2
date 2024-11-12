# Servidor HTTP PHP en Docker

Este es un ejemplo básico de un servidor HTTP que ejecuta PHP, empaquetado en un contenedor de Docker.

## Descripción

El servidor web se basa en la imagen oficial de PHP con Apache, y sirve una página web simple que muestra el mensaje "¡Hola Mundo desde PHP!".

## Requisitos

- Docker (para ejecutar la aplicación en un contenedor)

## Instalación y Ejecución

### Ejecutar en Docker

1. Clona el repositorio: git clone https://github.com/tu-usuario/php-http-server.git

2. Accede al directorio del proyecto:
cd php-http-server
3. Construye la imagen de Docker:
docker build -t php-http-server .
4. Ejecuta el contenedor:
docker run -p 80:80 php-http-server

5. Abre tu navegador y ve a `http://localhost`.

## Estructura del Proyecto

- `Dockerfile`:
```dockerfile
# Usa una imagen base de PHP con Apache
FROM php:8.0-apache
# Copia el archivo index.php al contenedor
COPY app.php /var/www/html/
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
