# Cómo publicar una web en tu Raspberry Pi con Nginx

Esta guía explica paso a paso cómo desplegar una página web en una Raspberry Pi usando Nginx como servidor, y cómo activar HTTPS mediante Certbot y DuckDNS.

---

## Requisitos previos

Antes de comenzar, asegúrate de:

- Haber configurado duckDNS ([Consulta el tutorial](DuckDNS.md))
- Haber configurado previamente port forwarding ([Consulta el tutorial](PortForwarding.md))

---

## Despliegue de la web

### 1. Copiar la carpeta al servidor

En tu máquina local, organiza tu proyecto en una carpeta —por ejemplo, `WebVeterinaria`— y asegúrate de que el archivo principal HTML se llame `index.html` y esté en la raíz de la carpeta.

```bash
# Copia recursiva de la carpeta al home del usuario 'biel' en la Raspberry (puerto 2222):
scp -P 2222 -r ~/Desktop/WebVeterinaria biel@raspberryBiel.local:~
```

> **Nota:** Sustituye `~/Desktop/WebVeterinaria` por la ruta real de tu proyecto, `biel` por el usuario de tu Raspberry y `raspberryBiel.local` por el hostname o IP de tu Raspberry.

---

### 2. Vaciar la carpeta de Nginx

Para asegurarnos de que no queden restos de publicaciones anteriores, eliminamos todo el contenido de `/var/www/html/`:

```bash
sudo rm -rf /var/www/html/*
```

> ⚠️ Ten mucho cuidado con `rm -rf`. Asegúrate de escribir la ruta correcta.

---

### 3. Copiar los archivos de la nueva web

Asumiendo que tu nueva web está en `~/WebVeterinaria/` en la Raspberry, copia su contenido al directorio raíz de Nginx:

```bash
sudo cp -r ~/WebVeterinaria/* /var/www/html/
```

Esto trasladará todos los archivos (HTML, CSS, JS, imágenes, etc.) a `/var/www/html/`.

---

### 4. Ajustar permisos

Para que Nginx (que corre bajo el usuario `www-data`) pueda servir los archivos sin problemas:

```bash
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

- `chown -R www-data:www-data`: cambia el propietario y grupo de todos los archivos a `www-data`.
- `chmod -R 755`: otorga permisos de lectura y ejecución a todos los usuarios, y escritura al propietario.

---

### 5. Reiniciar Nginx

Recarga (o reinicia) Nginx para que recoja cualquier cambio en la configuración y los nuevos archivos:

```bash
sudo systemctl reload nginx
```

Si prefieres reiniciar completamente:

```bash
sudo systemctl restart nginx
```

---

### 6. Comprobar en el navegador

- **En tu red local**:
  Abrir en el navegador:
  ```
  http://raspberryBiel.local
  ```
  o bien la IP de la Raspberry (por ejemplo, `http://192.168.1.50`).

- **Desde internet (si tienes DuckDNS y HTTPS activo)**:
  ```
  https://raspberrybielsbd.duckdns.org
  ```

---

## Activar HTTPS con Certbot y DuckDNS

Para servir tu web mediante HTTPS, utilizaremos **Certbot** (Let's Encrypt) y un dominio gratuito de DuckDNS.

### 1. Instalar Certbot

Conéctate por SSH a tu Raspberry y actualiza el repositorio:

```bash
sudo apt update
sudo apt install certbot python3-certbot-nginx
```

- `certbot`: herramienta para obtener certificados SSL/TLS.
- `python3-certbot-nginx`: plugin para configurar automáticamente Nginx.

---

### 2. Obtener y configurar el certificado

Ejecuta Certbot indicándole el nombre de tu dominio DuckDNS. Sustituye `raspberrybiel.duckdns.org` por tu dominio real:

```bash
sudo certbot --nginx -d raspberrybiel.duckdns.org
```

Sigue los pasos en pantalla para:

1. Seleccionar el email de registro (recomendado para notificaciones de renovación).
2. Aceptar los términos de servicio de Let's Encrypt.
3. Elegir si quieres redirigir automáticamente HTTP a HTTPS (recomendado).

Certbot modificará tu configuración de Nginx para apuntar al certificado obtenido.

---

### 3. Verificar la conexión HTTPS

Una vez completado el proceso, abre tu navegador y visita:

```
https://raspberrybiel.duckdns.org
```

- Deberías ver el candado de sitio seguro.
- Si aparece un error, revisa `/var/log/letsencrypt/letsencrypt.log` o prueba de nuevo.

---

### 4. Renovación automática del certificado

Certbot instala automáticamente un **cron job** o un **systemd timer** que renueva el certificado antes de su caducidad (cada 60 días). Para verificar manualmente que la renovación funciona correctamente:

```bash
sudo certbot renew --dry-run
```

- Si no surgen errores, la renovación automática está correctamente configurada.
- En caso de fallo, revisa los permisos y la configuración de Nginx.

---

## Optimización: activar compresión GZIP en Nginx

La compresión GZIP reduce el tamaño de los archivos servidos (HTML, CSS, JS, etc.) y acelera la carga en el cliente. Sigue estos pasos:

1. Abre el archivo de configuración global de Nginx:
   ```bash
   sudo nano /etc/nginx/nginx.conf
   ```

2. Dentro del bloque `http { ... }`, añade o verifica las siguientes directivas:
   ```nginx
   http {
       # ... otras directivas ...

       gzip on;
       gzip_disable "msie6";

       gzip_vary on;
       gzip_proxied any;
       gzip_comp_level 6;
       gzip_buffers 16 8k;
       gzip_http_version 1.1;
       gzip_types
           text/plain
           text/css
           application/json
           application/javascript
           text/xml
           application/xml
           application/xml+rss
           text/javascript;
   }
   ```

   - `gzip on;`: habilita la compresión.
   - `gzip_disable "msie6";`: deshabilita GZIP para navegadores IE 6.
   - `gzip_vary on;`: añade la cabecera `Vary: Accept-Encoding`.
   - `gzip_proxied any;`: permite compresión al servir a clientes detrás de proxies.
   - `gzip_comp_level 6;`: nivel de compresión (1–9).
   - `gzip_buffers 16 8k;`: buffers de compresión.
   - `gzip_http_version 1.1;`: solicita compresión sólo si el cliente soporta HTTP/1.1.
   - `gzip_types ...;`: lista de tipos MIME a comprimir.

3. Guarda los cambios y sal de `nano` (Ctrl + O, Enter → Ctrl + X).

4. Reinicia Nginx para aplicar la configuración:
   ```bash
   sudo systemctl reload nginx
   ```

> **Tip:** Puedes probar si GZIP está funcionando usando herramientas como [GTmetrix](https://gtmetrix.com/) o la pestaña **Network** de las herramientas de desarrollo del navegador (busca la columna “Contenido comprimido” o “Size” vs. “Transferred”).
