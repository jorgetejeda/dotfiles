# Atajos de Zellij

> Config: `zellij/.config/zellij/config.kdl` · Tema **kanagawa** · `default_mode = normal`.
> Zellij es **modal**: entras a un modo, ejecutas una acción y (casi siempre) vuelves a `normal`.

---

## 🔒 Modo bloqueado (locked)

| Tecla | Acción |
|---|---|
| `Ctrl g` | Alterna entre **locked** y **normal**. En locked, todas las teclas van a la terminal (no a Zellij). |

Úsalo cuando una app (vim, htop) necesite las combinaciones que Zellij captura.

---

## 🚪 Entrar a cada modo (desde normal)

| Tecla | Modo |
|---|---|
| `Ctrl p` | **pane** (paneles) |
| `Ctrl t` | **tab** (pestañas) |
| `Ctrl n` | **resize** (redimensionar) |
| `Ctrl h` | **move** (mover panel) |
| `Ctrl s` | **scroll** (desplazamiento/búsqueda) |
| `Ctrl o` | **session** (sesión) |
| `Ctrl b` | **tmux** (compatibilidad tmux) |
| `Ctrl g` | **locked** |
| `Esc` / `Enter` | Volver a **normal** |

---

## 🌍 Atajos globales (funcionan en casi todos los modos, excepto locked)

| Tecla | Acción |
|---|---|
| `Alt n` | Nuevo panel |
| `Alt f` | Toggle paneles flotantes |
| `Alt h/j/k/l` o `Alt ←↓↑→` | Mover foco entre paneles / pestañas |
| `Alt +` / `Alt -` / `Alt =` | Aumentar / disminuir tamaño del panel |
| `Alt [` / `Alt ]` | Layout anterior / siguiente (swap) |
| `Alt i` / `Alt o` | Mover pestaña a la izquierda / derecha |
| `Alt p` | Alternar panel en el grupo |
| `Alt Shift p` | Toggle marcado de grupo |
| `Ctrl q` | **Salir de Zellij** — abre un panel flotante de confirmación (`y` para cerrar, cualquier otra tecla cancela) |

---

## 🪟 Modo Pane (`Ctrl p`)

| Tecla | Acción |
|---|---|
| `h/j/k/l` o flechas | Mover el foco |
| `n` | Nuevo panel |
| `d` | Nuevo panel abajo |
| `r` | Nuevo panel a la derecha |
| `s` | Nuevo panel apilado (stacked) |
| `x` | Cerrar panel enfocado |
| `f` | Fullscreen del panel |
| `z` | Toggle bordes de panel (frames) |
| `w` | Toggle paneles flotantes |
| `e` | Embeber / flotar el panel |
| `p` | Cambiar foco (rotar) |
| `i` | Fijar (pin) panel flotante |
| `c` | Renombrar panel |
| `Ctrl p` / `Esc` | Volver a normal |

---

## 📑 Modo Tab (`Ctrl t`)

| Tecla | Acción |
|---|---|
| `n` | Nueva pestaña |
| `x` | Cerrar pestaña |
| `r` | Renombrar pestaña |
| `1`–`9` | Ir a la pestaña 1–9 |
| `h/k` o `←↑` | Pestaña anterior |
| `j/l` o `↓→` | Pestaña siguiente |
| `tab` | Alternar con la última pestaña |
| `s` | Toggle sincronización de la pestaña |
| `b` | Separar panel en pestaña nueva |
| `[` / `]` | Separar panel a la pestaña izquierda / derecha |
| `Ctrl t` / `Esc` | Volver a normal |

---

## 📐 Modo Resize (`Ctrl n`)

| Tecla | Acción |
|---|---|
| `h/j/k/l` o flechas | Aumentar hacia esa dirección |
| `H/J/K/L` (mayúsculas) | Disminuir hacia esa dirección |
| `+` / `=` | Aumentar |
| `-` | Disminuir |
| `Ctrl n` / `Esc` | Volver a normal |

---

## ↔️ Modo Move (`Ctrl h`)

| Tecla | Acción |
|---|---|
| `h/j/k/l` o flechas | Mover el panel en esa dirección |
| `n` o `tab` | Mover panel (rotar hacia adelante) |
| `p` | Mover panel hacia atrás |
| `Ctrl h` / `Esc` | Volver a normal |

---

## 🔍 Modo Scroll / Búsqueda (`Ctrl s`)

| Tecla | Acción |
|---|---|
| `j/k` o `↓↑` | Desplazar una línea |
| `Ctrl f` / `Ctrl b` | Página adelante / atrás |
| `d` / `u` | Media página abajo / arriba |
| `PageDown` / `PageUp` | Página abajo / arriba |
| `e` | Editar scrollback en tu `$EDITOR` |
| `s` | Entrar a búsqueda (escribes el término + `Enter`) |
| `Ctrl c` | Ir al fondo y volver a normal |
| `Ctrl s` / `Esc` | Volver a normal |

**Dentro de la búsqueda** (después de buscar): `n` siguiente · `p` anterior · `c` case-sensitive · `o` palabra completa · `w` wrap.

---

## 🗂️ Modo Session (`Ctrl o`)

| Tecla | Acción |
|---|---|
| `w` | **Session manager** (cambiar/crear sesiones) |
| `d` | **Detach** (desconectar de la sesión) |
| `a` | Acerca de Zellij |
| `c` | Configuración |
| `l` | Gestor de layouts |
| `p` | Gestor de plugins |
| `s` | Compartir sesión |
| `Ctrl o` / `Esc` | Volver a normal |

---

## 🧩 Modo Tmux (`Ctrl b`)

Compatibilidad con reflejos de tmux:

| Tecla | Acción |
|---|---|
| `"` | Nuevo panel abajo |
| `%` | Nuevo panel a la derecha |
| `c` | Nueva pestaña |
| `n` / `p` | Pestaña siguiente / anterior |
| `,` | Renombrar pestaña |
| `x` | Cerrar panel |
| `z` | Fullscreen |
| `o` | Siguiente panel |
| `space` | Siguiente layout |
| `[` | Entrar a modo scroll |
| `d` | Detach |
| `h/j/k/l` o flechas | Mover foco |
| `Ctrl b` | Enviar `Ctrl b` literal a la terminal |

---

## 🏷️ Plugin zellij-attention

Añade iconos al nombre de la pestaña según el estado de Claude Code:

| Icono | Estado |
|---|---|
| ⏳ | Trabajando / esperando input |
| ✅ | Terminó |

Se controla automáticamente por los hooks de Claude Code (`UserPromptSubmit`, `Notification`, `Stop`), no por teclas.

---

> 💡 Regla mental: **`Ctrl` + letra** = entrar a un modo · **`Alt` + tecla** = acción directa global · **`Ctrl g`** = pausar Zellij (locked).
