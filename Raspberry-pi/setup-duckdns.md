# Configurar DuckDNS en Raspberry Pi

Esta guía muestra cómo crear y mantener un subdominio gratuito en DuckDNS para tu Raspberry Pi, de manera que tu IP dinámica se actualice automáticamente.

---

## Índice

1. [Registro en DuckDNS](#registro-en-duckdns)
2. [Creación del script de actualización](#creación-del-script-de-actualización)
3. [Programar actualización automática con cron](#programar-actualización-automática-con-cron)
4. [Verificación del funcionamiento](#verificación-del-funcionamiento)
5. [Consejos y buenas prácticas](#consejos-y-buenas-prácticas)

---

## Registro en DuckDNS

1. Abre tu navegador y accede a [DuckDNS](https://www.duckdns.org/).
2. Regístrate o accede con tu cuenta de GitHub, Google, Twitter o Reddit.
3. En la sección **Domains**, añade un nuevo subdominio (por ejemplo, `raspberryBiel`).
4. Anota el **token** que DuckDNS te proporciona; lo necesitarás para el script de actualización.

---

## Creación del script de actualización

En tu Raspberry Pi, abre una terminal y crea una carpeta dedicada a DuckDNS:

```bash
mkdir -p ~/duckdns
cd ~/duckdns
```

A continuación, crea el archivo `duck.sh` con el siguiente contenido:

```bash
cat > duck.sh << 'EOF'
#!/bin/bash

# Sustituye 'raspberryBiel' por tu subdominio y 'TOKEN' por tu token de DuckDNS
DOMAIN="raspberryBiel"
TOKEN="TU_TOKEN_AQUÍ"
URL="https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip="

# Realiza la petición y guarda el resultado en logs
curl -s "$URL" > duck.log 2>&1
EOF
```

**Pasos posteriores:**

1. Haz que el script sea ejecutable:
   ```bash
   chmod +x ~/duckdns/duck.sh
   ```
2. Edita `duck.sh` con tu subdominio y token reales:
   ```bash
   nano ~/duckdns/duck.sh
   ```
   - Reemplaza `raspberryBiel` por tu subdominio DuckDNS.
   - Reemplaza `TU_TOKEN_AQUÍ` por el token que obtuviste en el paso anterior.

---

## Programar actualización automática con cron

Para que DuckDNS reciba una petición cada 5 minutos (lo cual mantiene tu IP actualizada):

1. Abre el crontab:
   ```bash
   crontab -e
   ```
2. Añade la siguiente línea al final del archivo:
   ```cron
   */5 * * * * /home/pi/duckdns/duck.sh
   ```
   - Esto ejecutará `duck.sh` cada 5 minutos.
   - Asegúrate de que la ruta absoluta sea correcta (por defecto, `pi` es el usuario). Si tu usuario es diferente, ajusta `/home/pi/duckdns/duck.sh` acorde.

> **Nota:** DuckDNS requiere al menos una petición cada 30 minutos para mantener activo tu dominio. Una frecuencia de 5 minutos te dará un margen amplio.

---

## Verificación del funcionamiento

1. Después de unos minutos, revisa el log generado por el script:
   ```bash
   cat ~/duckdns/duck.log
   ```
   - Deberías ver `OK` o tu dirección IP actual.
   - Si hay errores, revisa que el subdominio y el token sean correctos.

2. Comprueba que tu dominio responde:
   ```bash
   ping -c 1 raspberryBiel.duckdns.org
   ```
   - Sustituye `raspberryBiel` por tu subdominio.
   - El resultado debería mostrar tu IP pública.

3. (Opcional) Visita tu subdominio desde otro dispositivo:
   ```
   http://raspberryBiel.duckdns.org
   ```
   - Si tienes un servidor web configurado (por ejemplo, Nginx), verás el contenido servido por tu Raspberry Pi.

---

## Consejos y buenas prácticas

- **Seguridad**:
  - No compartas tu token públicamente.
  - Mantén actualizada tu Raspberry Pi con:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

- **Logs rotativos (opcional)**:
  Con el tiempo, `duck.log` puede crecer. Para rotarlo, puedes:
  1. Instalar `logrotate` si no lo tienes:
     ```bash
     sudo apt install logrotate
     ```
  2. Crear un archivo de configuración en `/etc/logrotate.d/duckdns`:
     ```text
     /home/pi/duckdns/duck.log {
         daily
         rotate 7
         compress
         missingok
         notifempty
         copytruncate
     }
     ```
     Esto mantendrá 7 días de logs comprimidos y rotará diariamente.

- **Ajuste de frecuencia**:
  Si tu IP pública cambia con menor frecuencia, puedes ajustar el cron a cada 10 o 15 minutos, pero no excedas los 30 minutos entre peticiones.

- **Monitoreo**:
  Considera configurar alertas por correo o Telegram si el log muestra errores recurrentes.

---

*Fin de la guía.*  
