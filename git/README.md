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
> [!TIP]
> Como escribir buenos mensajes:
> Debe responder a "This commit will_____"

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

## 6. Branching

### Flujo de trabajo típico con ramas

1. Clona el repositorio
2. Crea una nueva rama desde `main` u otra rama
3. Realiza tus cambios
4. Haz `push` de la rama al repositorio remoto
5. Abre un **Pull Request** en GitHub
6. Fusiona los cambios (merge) desde GitHub
7. Haz `pull` de los cambios fusionados a tu rama `main` local
8. Repite desde el paso 2 para futuras tareas

---

### Crear y gestionar ramas

Para **crear una nueva rama** desde la rama actual:
```bash
git branch nombre-rama
```

Para **cambiar a una rama existente**:
```bash
git checkout nombre-rama
```

Para **volver a la rama `main`**:
```bash
git checkout main
```

> [!TIP]
> Puedes **crear y moverte directamente a una nueva rama** con un solo comando:
> ```bash
> git checkout -b nombre-rama
> ```

---

### Desde qué rama se crea una nueva

Al crear una rama, **se copia desde la rama en la que estás actualmente**.
Si estás en `main`, la nueva rama se basará en el estado actual de `main`.

También puedes especificar explícitamente desde qué rama quieres crear otra, sin cambiarte previamente a ella:

```bash
git branch nueva-rama rama-base
```

---

### Subir una rama al repositorio remoto

Después de crear una rama local, si quieres trabajar colaborativamente o tener una copia en el servidor, debes hacer `push`:

```bash
git push -u origin nombre-rama
```

#### ¿Qué significa `-u` o `--set-upstream`?

Ambos (`-u` y `--set-upstream`) hacen lo mismo:

```bash
git push --set-upstream origin nombre-rama
```

Esto **establece una relación de seguimiento** entre tu rama local y la remota. Así, más adelante podrás usar simplemente:

```bash
git push
git pull
```

sin tener que especificar el nombre remoto ni de la rama.

---

### Hacer merge y usar Pull Requests

#### Desde GitHub

1. Una vez subas tu rama, ve al repositorio en GitHub.
2. Verás un mensaje para abrir un **Pull Request** (PR).
3. Haz clic en "Compare & pull request".
4. Añade un mensaje, revisa los cambios y envía el PR.
5. Tras revisión, puedes **fusionar (merge)** el PR a `main` desde GitHub.
6. Finalmente, sincroniza tu rama `main` local con los cambios:

```bash
git checkout main
git pull origin main
```

### Convenciones importantes
* origin: Nombre por defecto del repositorio remoto
* main: Rama principal (antes llamada master)
* U: Archivos no rastreados (Untracked)
* A: Archivos en staging (Added)


