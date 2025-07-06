# Git: Instalación y Configuración Básica

## 1. Conceptos Clave
- **Git**: Sistema de control de versiones local
- **GitHub**: Plataforma para alojar repositorios remotos
- **Repositorio local**: En tu ordenador (se crea con `git init`)
- **Repositorio remoto**: En la nube (como GitHub) para colaboración

## 2. Configuración Inicial
Configuración global (solo una vez)
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
git config --global init.defaultBranch main
```
> A partir de ahora, cuando crees un nuevo repositorio con `git init`, la rama principal por defecto será `main` en lugar de `master`.

Inicializar el repositorio

```bash
git init
```


## 3. Flujo de trabajo básico
**Comandos esenciales**

- `git status` — Muestra el estado actual de los archivos en el repositorio.
- `git log` — Muestra el historial de commits.

**Manejo de cambios**

Añadir archivos específicos
```bash
git add archivo.txt
```
Añadir todos los archivos sin añadir
```bash
git add ./
```
> Añadir significa decirle a Git que quieres incluir este archivo en el próximo commit.

Luego hay que hacer el commit (La instantánea)

```bash
git commit -m "Mensaje descriptivo"
```


## 4. Control de versiones
Ver el log (Donde saldrá cada hash)
```bash
git log
```
Volver atrás
```bash
git checkout <hash>
```

> Esto te lleva a un estado llamado **Detached HEAD**. Estás viendo cómo estaba el proyecto en ese punto, pero no estás en ninguna rama activa.

Volver a la rama principal
```bash
git checkout main
```
## 5. Trabajo con github
**Configuración inicial**
1. Crear repositorio en GitHub (sin README inicial)
2. Vincular repositorio local


```bash
git remote add origin RemplazarPorURL
git branch -M main
git push -u origin main
```

---
### Convenciones importantes
* origin: Nombre por defecto del repositorio remoto
* main: Rama principal (antes llamada master)
* U: Archivos no rastreados (Untracked)
* A: Archivos en staging (Added)

