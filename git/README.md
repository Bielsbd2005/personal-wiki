# Guía Básica de Git

## 1. Configuración Inicial de Git

Configura tu identidad global (esto solo lo necesitas hacer una vez):

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
git config --global init.defaultBranch main
```

> **Nota**: Esto configura tu nombre, correo y establece `main` como la rama principal en todos los nuevos proyectos.

### Inicializar un Repositorio

Para empezar a usar Git en un proyecto, inicializa el repositorio local:

```bash
git init
```

## 2. Flujo Básico de Trabajo

Los comandos básicos para interactuar con tu repositorio local son los siguientes:

```bash
git status                  # Verifica el estado actual del repositorio (archivos modificados, no añadidos)
git add archivo.txt         # Añadir un archivo específico al "staging" (area de preparación para commit)
git add .                   # Añadir todos los archivos modificados al staging
git commit -m "Mensaje"     # Guardar los cambios en el repositorio local
```

> **Consejo**: El comando `git add` le dice a Git que quieres incluir ese archivo en el próximo commit.

> **💡** Recuerda que `git commit` guarda tus cambios localmente, pero todavía no están en GitHub.

### Cómo escribir buenos mensajes de commit

Un buen mensaje de commit debe ser claro y conciso. Una buena práctica es empezar el mensaje con una frase que responda a **"This commit will..."**, por ejemplo:
- "fix bug in user login"

## 3. Subir Cambios a GitHub

### Vincular un Repositorio Remoto

Para vincular tu repositorio local a GitHub, utiliza el siguiente comando:

```bash
git remote add origin URL_DEL_REPO
```

### Primer Push

Cuando subas tu código por primera vez, debes usar `-u` para enlazar tu rama local con la remota:

```bash
git push -u origin main
```
Cuando cree una nueva rama es lo mismo:
```bash
git push -u origin nueva-rama
```

Esto hace dos cosas:

- Sube tus commits a GitHub.
- Establece un "tracking" entre tu rama local y la remota para facilitar futuros push.

### Push Posteriores

Después de realizar cambios y commits, puedes subirlos sin especificar la rama (git recuerda esta relación por lo que si cambio de rama, una vez que vuelva podré seguir usado "git push"):

```bash
git push
```
### Descargar Cambios Remotos

Para traer cambios del repositorio remoto a tu repositorio local:

```bash
git pull
```

### Resumen Rápido de Comandos

| Situación                           | Comando                          |
| ----------------------------------- | -------------------------------- |
| Primera vez en una rama             | `git push -u origin nombre-rama` |
| Push en una rama ya enlazada        | `git push`                       |
| Descargar cambios de la rama remota | `git pull`                       |

## 5. Ramas (Branching)

### Flujo típico con ramas
1. Crear nueva rama desde `main`
2. Hacer cambios + `add` + `commit`
3. Subir la rama con `git push -u origin rama`
4. Crear Pull Request en GitHub
5. Hacer merge desde GitHub
6. Sincronizar `main` local: `git checkout main && git pull`

### Crear y Moverse entre Ramas

Para **crear una nueva rama**:

```bash
git branch nombre-rama
```

Para **cambiar a una rama existente**:

```bash
git checkout nombre-rama
```

Si deseas **crear una nueva rama y cambiarte a ella al mismo tiempo**:

```bash
git checkout -b nueva-rama
```

## 6. Control de Versiones y Revisión

### Ver Historial de Commits

Para ver el historial de tus commits:

```bash
git log
```

### Navegar a un Commit Anterior

Si necesitas ver el estado de tu código en un commit anterior, utiliza el hash del commit:

```bash
git checkout <hash>
```

> **💡** Esto te pone en un estado **"detached"** (desconectado). Para volver, usa:

```bash
git checkout main
```

### Hacer Merge y Usar Pull Requests

#### Desde GitHub

1. Después de subir tu rama, ve a GitHub.
2. Verás un mensaje para abrir un **Pull Request** (PR).
3. Haz clic en "Compare & pull request".
4. Añade un mensaje de descripción y revisa los cambios.
5. Una vez revisado, fusiona (merge) el PR en `main`.
6. Finalmente, sincroniza tu rama `main` local:
   ```bash
   git checkout main
   git pull origin main
   ```

## 7. Conceptos Clave y Convenciones

- **origin**: El nombre por defecto del repositorio remoto.
- **main**: La rama principal del proyecto (anteriormente era `master`).
- **Untracked** (U): Archivos no rastreados, no han sido añadidos al repositorio.
- **Staging Area** (A): Archivos que han sido añadidos para el próximo commit.
- **Modified** (M): Han sido modificados desde el último commit, pero no han sido añadidos al staging
- **Deleted** (D): Si eliminas un archivo rastreado
- **Renamed** (R): Git puede detectar si un archivo ha sido renombrado
