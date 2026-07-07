# Recetas de Git

> Soluciones a las situaciones que se repiten con frecuencia. Copia y pega los comandos.
> Regla mental: **behind** = te faltan commits del remoto (baja antes de subir) · **ahead** = tienes commits que el remoto no tiene (sube) · **ambos a la vez** = divergiste → hay que reconciliar con `rebase`.

---

## 🔍 1. Diagnosticar dónde estás parado

Antes de tocar nada, mira el estado real local vs remoto:

```bash
git fetch origin        # baja info del remoto SIN tocar tu trabajo
git status -sb          # muestra "ahead X, behind Y" si divergiste
```

- `## main...origin/main [ahead 4]` → solo te falta hacer push.
- `## main...origin/main [behind 2]` → solo te falta bajar (pull).
- `## main...origin/main [ahead 4, behind 2]` → **divergiste** → ve a la sección 2.

---

## 🔀 2. "Hay cambios que bajar y subir" (ramas divergidas)

El caso más común: el remoto avanzó y tú también tienes commits locales, así que `git push` falla.
La forma limpia (historia lineal) es **rebase**: reaplica tus commits locales *encima* de los del remoto.

```bash
git fetch origin
git rebase origin/main
```

- **Si termina solo** (sin conflicto): salta a la sección 4 y haz push.
- **Si se detiene por conflicto**: ve a la sección 3.

Atajo (fetch + rebase en un solo comando):

```bash
git pull --rebase origin main
```

---

## ⚔️ 3. Resolver un conflicto de merge/rebase

Git se detiene y te dice qué archivo chocó. Pasos:

```bash
git status              # lista los archivos "both modified" (en conflicto)
```

Abre cada archivo en conflicto y busca los marcadores:

```
<<<<<<< HEAD
versión que ya estaba (la del remoto durante un rebase)
=======
tu versión (la de tu commit)
>>>>>>> abc1234 (mensaje de tu commit)
```

Edita el bloque para dejar el código como debe quedar y **borra las tres líneas de marcadores** (`<<<<<<<`, `=======`, `>>>>>>>`). Luego:

```bash
git add <archivo-resuelto>     # marca ese archivo como resuelto
git rebase --continue          # continúa con el siguiente commit
```

Repite hasta que el rebase termine.

### Botón de pánico

```bash
git rebase --abort             # cancela todo y vuelve a como estabas antes del rebase
```

### Quedarte con una versión completa (sin editar a mano)

```bash
git checkout --theirs <archivo>   # durante rebase: versión del remoto (la base)
git checkout --ours   <archivo>   # durante rebase: TU versión
git add <archivo>
git rebase --continue
```

> Ojo: en un **rebase**, `--ours` y `--theirs` están invertidos respecto a lo intuitivo
> (`ours` = la rama sobre la que reaplicas = el remoto; `theirs` = tu commit).

---

## ⬆️ 4. Subir los cambios

```bash
git push origin main
```

Si reescribiste historia (rebase de commits que YA habías subido), necesitas forzar de forma segura:

```bash
git push --force-with-lease origin main
```

> `--force-with-lease` solo fuerza si nadie más subió cambios entretanto — más seguro que `--force`.

---

## 🧹 5. Deshacer y limpiar (rescates comunes)

```bash
git commit --amend                       # corregir el ÚLTIMO commit (mensaje o archivos)
git reset --soft HEAD~1                  # deshacer el último commit, CONSERVANDO los cambios staged
git reset --mixed HEAD~1                 # deshacer el último commit, dejando los cambios sin stage
git restore <archivo>                    # descartar cambios NO commiteados de un archivo
git restore --staged <archivo>           # quitar del stage sin perder los cambios
git stash        /  git stash pop        # guardar cambios temporalmente / recuperarlos
```

Corregir la **autoría** de los últimos N commits (p. ej. tras configurar tu email):

```bash
git config --global user.name  "Tu Nombre"
git config --global user.email "tu@email.com"
git rebase HEAD~N --exec "git commit --amend --reset-author --no-edit"
```

---

## ⚙️ 6. Configuración que evita estos líos

```bash
git config --global pull.rebase true     # que 'git pull' siempre haga rebase (no merge-commits)
git config --global rebase.autoStash true # guarda/restaura cambios sin commitear al hacer rebase
```

Con esto, el flujo del día a día se reduce a:

```bash
git pull        # baja y reaplica tus commits encima automáticamente
git push        # sube
```
