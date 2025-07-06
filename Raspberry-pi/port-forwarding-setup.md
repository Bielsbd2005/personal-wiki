
# Guía de Port Forwarding en el Router para SSH, HTTP y HTTPS

> ⚠️ **IMPORTANTE:**
> Antes de empezar, asigna una **IP estática** a tu Raspberry Pi en la configuración del router

## 1. SSH (puerto 2222)

### Pasos
1. Accede al router:
   - Abre el navegador y entra a la IP del router (p.ej. `192.168.1.1` o `192.168.0.1`).
   - Inicia sesión con tu usuario y contraseña de administrador.
2. Ve a **Port Forwarding** (también puede llamarse “Virtual Server” o “NAT”).
3. Crea una nueva regla:
   - **Nombre**: `SSH Raspberry`
   - **Protocolo**: `TCP`
   - **Puerto externo**: `2222`
   - **IP interna**: `TU_IP_DE_RASPBERRY`
   - **Puerto interno**: `2222`

## 2. HTTP (puerto 80)

### Pasos
1. Accede a la sección de **Port Forwarding**.
2. Crea una nueva regla:
   - **Nombre**: `HTTP Web Server`
   - **Protocolo**: `TCP`
   - **Puerto externo**: `80`
   - **IP interna**: `TU_IP_DE_RASPBERRY`
   - **Puerto interno**: `80`

## 3. HTTPS (puerto 443)

### Pasos
1. Accede a la sección de **Port Forwarding**.
2. Crea una nueva regla:
   - **Nombre**: `HTTPS Web Server`
   - **Protocolo**: `TCP`
   - **Puerto externo**: `443`
   - **IP interna**: `TU_IP_DE_RASPBERRY`
   - **Puerto interno**: `443`
