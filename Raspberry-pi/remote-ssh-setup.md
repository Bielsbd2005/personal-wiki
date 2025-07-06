# Configurar SSH remoto en puerto 2222 en Raspberry Pi

Esta guía explica cómo cambiar el puerto por defecto de SSH al **2222** en tu Raspberry Pi para mejorar la seguridad, y cómo conectarte de forma remota usando el dominio `raspberrybiel.duckdns.org`.

---

## Índice

1. [Requisitos previos](#requisitos-previos)
2. [Cambiar el puerto SSH](#cambiar-el-puerto-ssh)
3. [Configurar el firewall (UFW)](#configurar-el-firewall-ufw)
4. [Reiniciar el servicio SSH](#reiniciar-el-servicio-ssh)
6. [Conexión remota vía DuckDNS](#conexión-remota-vía-duckdns)
7. [Opciones de seguridad adicionales](#opciones-de-seguridad-adicionales)
8. [Referencias](#referencias)

---

## Requisitos previos

- Haber configurado previamente el dominio DuckDNS (`raspberrybiel.duckdns.org`) y comprobado que responde correctamente.
- Haber configurado previamente port forwarding ([Consulta el tutorial](PortForwarding.md))

---

## Cambiar el puerto SSH

1. Abre el archivo de configuración de SSH:
   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Busca la línea que contiene:
   ```text
   #Port 22
   ```
   - Elimina el carácter `#` (si existe) y cambia el valor a:
     ```text
     Port 2222
     ```

3. (Opcional, pero recomendado) Desactiva el inicio de sesión de root mediante SSH. Busca:
   ```text
   PermitRootLogin yes
   ```
   y cámbialo a:
   ```text
   PermitRootLogin no
   ```

4. Guarda los cambios y cierra el editor:
   - Presiona `Ctrl + O` (para escribir cambios), luego `Enter`.
   - Presiona `Ctrl + X` (para salir).

> **Nota:** Al cambiar el puerto, SSH escuchará únicamente en el puerto 2222, dejando el puerto 22 desatendido.

---

## Configurar el firewall (UFW)

Para asegurar que solo el puerto 2222 esté permitido:

1. Instala UFW si no lo tienes:
   ```bash
   sudo apt update
   sudo apt install ufw
   ```

2. Permitir el puerto 2222 (TCP):
   ```bash
   sudo ufw allow 2222/tcp
   ```

3. (Opcional) Denegar el puerto 22 (TCP), ya que ya no se usará:
   ```bash
   sudo ufw deny 22/tcp
   ```

4. Comprueba el estado de UFW:
   ```bash
   sudo ufw status verbose
   ```
   Debe mostrarse algo similar a:
   ```
   Status: active
   To                         Action      From
   --                         ------      ----
   2222/tcp                   ALLOW       Anywhere
   22/tcp                     DENY        Anywhere
   ```

5. Si UFW está inactivo, actívalo **solo después** de confirmar que SSH en 2222 funciona:
   ```bash
   sudo ufw enable
   ```
   > **Advertencia:** Asegúrate de poder conectar por SSH al puerto 2222 antes de activar UFW, para evitar quedarte sin acceso.

---

## Reiniciar el servicio SSH

Para aplicar los cambios en el archivo de configuración:

```bash
sudo systemctl restart ssh
```

Verifica que SSH está escuchando en el puerto 2222:

```bash
sudo ss -tunlp | grep sshd
```

Deberías ver una línea como:
```
tcp   LISTEN  0       128    0.0.0.0:2222    0.0.0.0:*    users:(("sshd",pid=XXX,fd=3))
```

---

## Conexión remota vía DuckDNS

Una vez que hayas configurado el puerto y el port forwarding, podrás conectarte desde fuera de tu red local usando tu dominio DuckDNS:

```bash
ssh -p 2222 biel@raspberrybiel.duckdns.org
```

- `-p 2222`: indica el puerto SSH no estándar.
- `biel`: nombre de usuario en la Raspberry Pi.
- `raspberrybiel.duckdns.org`: dominio dinámico que apunta a tu IP pública.

Si todo está correctamente configurado, se te pedirá la contraseña (o se usará tu clave SSH) y obtendrás acceso remoto a tu Raspberry Pi.

---

## Opciones de seguridad adicionales

1. **Deshabilitar contraseña y usar solo claves SSH**
   - Genera un par de claves (si no lo has hecho):
     ```bash
     ssh-keygen -t rsa -b 4096
     ```
   - Copia tu clave pública a la Raspberry Pi (asumiendo puerto 2222):
     ```bash
     ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2222 biel@raspberrybiel.duckdns.org
     ```
   - En el servidor, edita `/etc/ssh/sshd_config`:
     ```text
     PasswordAuthentication no
     ```
   - Reinicia SSH:
     ```bash
     sudo systemctl restart ssh
     ```

2. **Cambiar el usuario predeterminado**
   - Crea un usuario nuevo con permisos limitados:
     ```bash
     sudo adduser usuario_seguro
     sudo usermod -aG sudo usuario_seguro
     ```
   - (Opcional) Deshabilita el usuario `pi`:
     ```bash
     sudo passwd -l pi
     ```
   - Conéctate con el nuevo usuario:
     ```bash
     ssh -p 2222 usuario_seguro@raspberrybiel.duckdns.org
     ```

3. **Instalar Fail2Ban**
   - Previene intentos de ataque por fuerza bruta:
     ```bash
     sudo apt update
     sudo apt install fail2ban
     sudo systemctl enable fail2ban
     sudo systemctl start fail2ban
     ```
   - Configura `/etc/fail2ban/jail.local` según tus necesidades (por ejemplo, límites de intentos).

4. **Configurar autenticación de dos factores (2FA)**
   - Puedes usar módulos como `libpam-google-authenticator` para añadir 2FA a SSH.

---
