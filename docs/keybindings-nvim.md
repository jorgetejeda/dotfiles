# Atajos de Neovim

> Perfil activo: **`may`** (definido en `nvim/.config/nvim/init.lua`).
> `<leader>` = **Barra espaciadora** (`Space`).

---

## 📍 marks.nvim (el plugin "mark" que buscabas)

Plugin: `chentoast/marks.nvim` → `nvim/.config/nvim/lua/may/plugins/marks.lua`

| Tecla | Acción |
|---|---|
| `mm` | Poner marca (toggle / siguiente marca automática) |
| `mn` | Ir a la **siguiente** marca |
| `mp` | Ir a la marca **anterior** |
| `mi` | **Preview** de una marca (ventana flotante grande, 85% de la pantalla) |
| `md` | Borrar las marcas del buffer |

> El preview abre el **buffer real** del archivo en una ventana flotante enfocada (puedes editarlo, `:w` guarda de verdad). Ciérrala con `<C-w>c` o `:q` — **no** con `q` a secas (eso graba una macro). Tamaño ajustable en `marks.lua` (variable `0.85`).

**Marcas nativas de Vim** (siguen funcionando):

| Tecla | Acción |
|---|---|
| `ma` | Fijar marca `a` (letra minúscula = marca local del buffer) |
| `` `a `` | Saltar a la posición exacta de la marca `a` |
| `'a` | Saltar al inicio de línea de la marca `a` |
| `:marks` | Listar todas las marcas |
| `` `` `` (backtick doble) | Volver a la posición anterior del salto |

---

## ⌨️ Generales (core/keymaps.lua)

| Tecla | Modo | Acción |
|---|---|---|
| `jk` | insert | Salir a modo normal |
| `<leader>nh` | normal | Limpiar el resaltado de búsqueda |
| `<leader>un` | normal | Descartar las notificaciones (`:NoiceDismiss`) |
| `<CR>` (Enter) | normal | Insertar línea abajo sin entrar a insert |
| `<S-CR>` (Shift+Enter) | normal | Insertar línea arriba sin entrar a insert |
| `<leader>\`` | normal | Alternar entre archivo actual y anterior |
| `<leader>cp` | normal | Copiar ruta relativa del archivo al portapapeles |
| `<leader><ESC>` | terminal | Salir del modo terminal |
| `za` | normal | Toggle fold bajo el cursor |
| `<Esc>f` | normal/visual | Formatear código (conform) |

**Folds:** `zc` cerrar · `zo` abrir · `za` toggle · `zR` abrir todos · `zM` cerrar todos.

**Notificaciones:** los avisos (toasts) son de `noice.nvim` + `nvim-notify`. Se auto-ocultan a los **2s** (`timeout` en `cmdline.lua`); para descartarlas al instante usa `<leader>un`.

### Ventanas (splits)

| Tecla | Acción |
|---|---|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Igualar tamaño de splits |
| `<leader>sx` | Cerrar split actual |

### Pestañas (tabs)

| Tecla | Acción |
|---|---|
| `<leader>to` | Nueva pestaña |
| `<leader>tx` | Cerrar pestaña |
| `<leader>tn` | Pestaña siguiente |
| `<leader>tp` | Pestaña anterior |
| `<leader>tf` | Abrir buffer actual en pestaña nueva |

### Acentos y signos en español (modo insert)

| Tecla | Resultado |
|---|---|
| `<Esc>a/e/i/o/u` | á é í ó ú (mayúsculas con `<Esc>A/E/I/O/U`) |
| `<Esc>n` / `<Esc>N` | ñ / Ñ |
| `<M-?>` / `<M-!>` | ¿ / ¡ |

### Teclas de control (`Ctrl`) — según el contexto

> ⚠️ Casi ninguna `Ctrl` es global: solo actúan **dentro** de su contexto (picker de Telescope, menú de autocompletado, chat, etc.). Por eso `<C-k>` hace cosas distintas según dónde estés.

| Tecla | Contexto | Acción |
|---|---|---|
| `<C-k>` / `<C-j>` | Picker de Telescope | Selección anterior / siguiente |
| `<C-q>` | Picker de Telescope | Enviar selección a la quickfix list |
| `<C-k>` / `<C-j>` | Menú de autocompletado (cmp) | Ítem anterior / siguiente |
| `<C-b>` / `<C-f>` | Menú de autocompletado (cmp) | Scroll de la documentación |
| `<C-Space>` | Insert (cmp) | Disparar el autocompletado |
| `<C-e>` | Insert (cmp) | Cancelar el autocompletado |
| `<C-]>` / `<C-[>` | Insert (Copilot) | Sugerencia siguiente / anterior |
| `<C-\>` | Insert (Copilot) | Descartar la sugerencia |
| `<C-l>` | CopilotChat | Reiniciar el chat |
| `<C-s>` | Insert (CopilotChat) | Enviar el mensaje |
| `<C-y>` | CopilotChat | Aceptar el diff |
| `<C-c>` | Insert (CopilotChat) | Cerrar el chat |
| `<C-n>` | Normal/visual (multicursor) | Seleccionar palabra / añadir siguiente ocurrencia |
| `<C-Down>` / `<C-Up>` | Normal (multicursor) | Añadir cursor abajo / arriba |
| `<C-w>c` | Cualquier ventana flotante | Cerrar la flotante (p. ej. el preview de marks) |

> Las combinaciones `<C-w>...` son de **Vim nativo** para ventanas (`<C-w>v` split vertical, `<C-w>s` horizontal, `<C-w>=` igualar, `<C-w>|` ancho máximo). Tus atajos `<leader>sv/sh/se/sx` no son más que alias de esos comandos. `<C-^>` alterna con el archivo anterior (usado por `<leader>\``).

---

## 🔭 Telescope (telescope.lua)

| Tecla | Acción |
|---|---|
| `<leader>ff` | Buscar archivos (cwd) |
| `<leader>fr` | Archivos recientes |
| `<leader>fs` | Buscar string (live grep) |
| `<leader>fc` | Buscar string bajo el cursor |
| `<leader>ft` | Buscar TODOs |

Dentro del picker: `<C-k>` subir · `<C-j>` bajar · `<C-q>` enviar a quickfix · `<Esc>` cerrar.

---

## 🌳 nvim-tree (explorador de archivos)

| Tecla | Acción |
|---|---|
| `<leader>ee` | Toggle explorador |
| `<leader>ef` | Toggle explorador sobre el archivo actual |
| `<leader>ec` | Colapsar explorador |
| `<leader>er` | Refrescar explorador |

### Manipular archivos y carpetas (dentro del árbol)

> ⚠️ Estas teclas solo funcionan con el **foco dentro del explorador** (son mapeos internos de nvim-tree, no llevan `<leader>`). Se aplican sobre el nodo bajo el cursor.

| Tecla | Acción |
|---|---|
| `a` | **Crear** archivo o carpeta — termina el nombre con `/` para que sea carpeta (`src/`) |
| `r` | **Renombrar** (nombre completo) |
| `e` | Renombrar solo el **basename** (sin la extensión) |
| `<C-r>` | Renombrar borrando el nombre actual para escribir de cero |
| `u` | Renombrar con la **ruta completa** |
| `d` | **Eliminar** (pide confirmación) |
| `D` | Eliminar enviando a la **papelera** (trash) |
| `x` | **Cortar** (para mover) |
| `c` | **Copiar** |
| `p` | **Pegar** lo cortado/copiado dentro de la carpeta bajo el cursor |
| `y` | Copiar el **nombre** del archivo al portapapeles |
| `Y` | Copiar la **ruta relativa** |
| `gy` | Copiar la **ruta absoluta** |

**Mover** un archivo = `x` (cortar) → navega a la carpeta destino → `p` (pegar).
**Duplicar/copiar** = `c` (copiar) → navega al destino → `p` (pegar).

---

## 🧠 LSP (lsp/lspconfig.lua)

| Tecla | Acción |
|---|---|
| `gR` | Referencias (Telescope) |
| `gD` | Ir a declaración |
| `gd` | Definiciones (Telescope) |
| `gi` | Implementaciones |
| `gt` | Definiciones de tipo |
| `K` | Documentación bajo el cursor (hover) |
| `<leader>ca` | Code actions |
| `<leader>rn` | Renombrar símbolo |
| `<leader>D` | Diagnósticos del buffer |
| `<leader>d` | Diagnóstico de la línea (float) |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<leader>rs` | Reiniciar LSP |

### Navegar el historial de saltos (jumplist — nativo)

> Cada `gd`, búsqueda o salto grande queda registrado. Sirve para volver **N archivos atrás**, no solo el anterior.

| Tecla | Acción |
|---|---|
| `<C-o>` | Volver **atrás** en el historial de saltos (N veces, cruza archivos) |
| `<C-i>` (= `<Tab>`) | Ir **adelante** en el historial |
| `<C-t>` | "Pop" del último salto a definición (pila de tags LSP) |
| `:jumps` | Ver la lista completa de saltos |

> Diferencia con `<leader>\``: ese solo **alterna entre 2 archivos** (actual ↔ anterior); el jumplist recorre toda la pila.

**Cómo funciona:** un "salto" es un movimiento grande (`gd`, `/buscar`, `G`, `{`/`}`). Moverte con `j`/`k`/`w` **no** cuenta. `<C-o>`/`<C-i>` son como los botones **atrás/adelante del navegador**, pero para el cursor (recuerdan archivo y línea). `N<C-o>` retrocede N saltos de golpe.

`<C-t>` es más específico: solo deshace **saltos a definición**. Útil para bajar por definiciones anidadas y luego subir: `gd` `gd` `gd` → `<C-t>` `<C-t>` `<C-t>`. `<C-o>` en cambio deshace cualquier salto.

`:jumps` muestra la lista; el `>` marca tu posición. Para saltar exacto, mira el número de la columna `jump` y pulsa `N<C-o>`:

```
 jump  line  col  file/text
   2     42   12  services/user.ts    ← 2<C-o> te lleva aquí
   1     88    2  utils.ts
>  0
```

> `:clearjumps` limpia la lista. Para navegar tus **últimas ediciones** (no saltos) existe el *changelist*: `g;` (atrás) y `g,` (adelante).

---

## 🐙 Git

**Gitsigns** (gitsigns.lua):

| Tecla | Acción |
|---|---|
| `<leader>gb` | Blame de la línea (float) |
| `<leader>gB` | Blame de la línea (commit completo) |
| `<leader>gbl` | Panel de blame (navegar commits) |
| `<leader>gn` / `<leader>gN` | Hunk siguiente / anterior |
| `<leader>gp` | Preview del hunk |
| `<leader>gr` | Reset del hunk |

**LazyGit** (lazygit.lua): `<leader>gg` → abrir LazyGit.

---

## 🚦 Trouble (diagnósticos)

| Tecla | Acción |
|---|---|
| `<leader>xx` | Abrir/cerrar lista Trouble |
| `<leader>xw` | Diagnósticos del workspace |
| `<leader>xd` | Diagnósticos del documento |
| `<leader>xq` | Quickfix |
| `<leader>xl` | Location list |
| `<leader>xt` | TODOs en Trouble |

---

## ✅ TODO comments

| Tecla | Acción |
|---|---|
| `]t` / `[t` | TODO siguiente / anterior |

---

## 🎯 Harpoon (harpoon.lua)

| Tecla | Acción |
|---|---|
| `<leader>h` | Agregar archivo a Harpoon |
| `<leader>a` | Abrir menú rápido de Harpoon |
| `<leader>1`…`<leader>5` | Saltar al archivo 1…5 |

> ℹ️ **Nota:** Harpoon usa `<leader>a` (menú) y `<leader>h` (agregar). Ya no hay colisión con Claude Code (ese plugin fue removido). `<leader>p` es de image-preview.


---

## 🐦 Copilot

**copilot.vim** (modo insert):

| Tecla | Acción |
|---|---|
| `<Tab>` | Aceptar sugerencia |
| `<C-]>` / `<C-[>` | Sugerencia siguiente / anterior |
| `<C-\>` | Descartar sugerencia |

**CopilotChat** (copilot-chat.lua, dentro del chat): `q` cerrar · `<C-l>` reset · `<C-s>` submit (insert) · `grr` reset · `grx` limpiar · `<C-y>` aceptar diff · `gj` jump · `gy` yank diff · `gd` mostrar diff · `gi` info · `gc` contexto · `gh` ayuda · `gqa`/`gqd` cola.

---

## ✍️ Edición

**nvim-cmp** (autocompletado, insert):

| Tecla | Acción |
|---|---|
| `<C-k>` / `<C-j>` | Ítem anterior / siguiente |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-Space>` | Disparar completado |
| `<C-e>` | Cancelar |
| `<CR>` | Confirmar |

**nvim-surround** (surround.lua):

| Comando | Ejemplo | Resultado |
|---|---|---|
| `ys<obj><char>` | `ysiw)` | `(palabra)` |
| `cs<viejo><nuevo>` | `cs'"` | cambia `'` por `"` |
| `ds<char>` | `ds]` | borra `[ ]` |

**Comment.nvim** (comment.lua): `gcc` comentar línea · `gc` (visual) comentar selección · `gbc` comentar en bloque · `<leader>gc` comentar línea/selección (alias).

**nvim-rip-substitute** (rip.lua) — buscar y reemplazar con preview en vivo (ripgrep):

| Tecla | Modo | Acción |
|---|---|---|
| `<leader>fu` | normal | Reemplazar en **todo el archivo** (abre UI con preview) |
| `<leader>fu` | visual | Reemplazar solo en la **selección** |

> Es la forma **más rápida de reemplazar todas las ocurrencias** de una palabra: no seleccionas nada, escribes viejo → nuevo y confirmas. Más simple que `\A` del multicursor.

**vim-visual-multi** (multi-line.lua) — multicursor. ⚠️ **Solo funciona en modo normal/visual, no en insert** (en insert `<C-n>` es el autocompletado de Vim).

Flujo: pon el cursor sobre una palabra en **modo normal** → `<C-n>` la selecciona → `<C-n>` de nuevo añade la siguiente ocurrencia → edita con `c`/`d`/`I`/`A` → `<Esc>` para salir.

| Tecla | Acción |
|---|---|
| `<C-n>` | Seleccionar palabra / añadir la siguiente ocurrencia |
| `n` / `N` | Ir a la ocurrencia siguiente / anterior (con VM activo) |
| `q` | Saltar la ocurrencia actual y buscar la siguiente |
| `Q` | Quitar el cursor actual |
| `[` / `]` | Navegar entre cursores |
| `<C-Down>` / `<C-Up>` | Añadir cursor abajo / arriba (columna) |
| `\A` | Seleccionar **todas** las ocurrencias de golpe |
| `<Tab>` | Alternar entre modo cursor y modo extender (visual) |
| `<Esc>` | Salir del multicursor |

> Ejemplo — renombrar `user` (3 sitios): cursor sobre `user` → `<C-n>` `<C-n>` `<C-n>` → `c` → escribes `cliente` → `<Esc>`.

**treesj** (treesj.lua) — expandir/juntar objetos y arrays: `<space>m` toggle · `<space>j` join · `<space>s` split.

---

## 🧘 UI / Sesiones / Extras

| Tecla | Plugin | Acción |
|---|---|---|
| `<leader>z` | zen-mode (ui.lua) | Zen Mode |
| `<leader>tw` | twilight | Toggle atenuado de código |
| `<leader>mp` | precognition | Toggle pistas de movimiento |
| `<leader>p` | image-preview | Previsualizar imagen |
| `<leader>l` | nvim-lint | Ejecutar linter en el archivo |
| `<leader>wr` | auto-session | Restaurar sesión del cwd |
| `<leader>ws` | auto-session | Guardar sesión del cwd |

---

## 🧩 Plugins instalados (perfil `may`)

> Fuente: specs en `nvim/.config/nvim/lua/may/plugins/`. Gestor: **lazy.nvim**.

### 🎨 Colorscheme y UI

| Plugin | Propósito | Spec |
|---|---|---|
| `ellisonleao/gruvbox.nvim` | Colorscheme **activo** (catppuccin, tokyonight y sonokai están instalados pero inactivos) | `colorschema.lua` |
| `nvim-lualine/lualine.nvim` | Statusline | `lualine.lua` |
| `goolord/alpha-nvim` | Dashboard de inicio | `alpha.lua` |
| `folke/noice.nvim` | UI de cmdline / mensajes / notificaciones (+ `nvim-notify`, `nui.nvim`) | `cmdline.lua` |
| `stevearc/dressing.nvim` | Mejora los `input`/`select` de Neovim | `dressing.lua` |
| `lukas-reineke/indent-blankline.nvim` | Guías de indentación | `index-blankline.lua` |
| `folke/which-key.nvim` | Ayuda de atajos en pantalla | `which-key.lua` |
| `folke/zen-mode.nvim` | Modo zen (sin distracciones) | `ui.lua` |
| `folke/twilight.nvim` | Atenúa el código inactivo | `twilight.lua` |
| `tris203/precognition.nvim` | Pistas de movimiento | `precognition.lua` |
| `NStefan002/screenkey.nvim` | Muestra las teclas pulsadas en pantalla | `screenkey.lua` |
| `MeanderingProgrammer/render-markdown.nvim` | Renderiza markdown en el buffer | `markdown.lua` |
| `adelarsq/image_preview.nvim` | Previsualiza imágenes | `image-preview.lua` |

### 🧭 Navegación y archivos

| Plugin | Propósito | Spec |
|---|---|---|
| `nvim-telescope/telescope.nvim` | Fuzzy finder (+ `telescope-fzf-native`) | `telescope.lua` |
| `nvim-tree/nvim-tree.lua` | Explorador de archivos | `nvim-tree.lua` |
| `theprimeagen/harpoon` | Marcado rápido de archivos | `harpoon.lua` |
| `chentoast/marks.nvim` | Marcas visuales | `marks.lua` |
| `christoomey/vim-tmux-navigator` | Navegación entre splits / tmux | `init.lua` |

### 🧠 LSP, completado y snippets

| Plugin | Propósito | Spec |
|---|---|---|
| `neovim/nvim-lspconfig` | Configuración de servidores LSP | `lsp/lspconfig.lua` |
| `williamboman/mason.nvim` | Gestor de LSP / linters / formatters (+ `mason-lspconfig`, `mason-tool-installer`) | `lsp/mason.lua` |
| `hrsh7th/nvim-cmp` | Autocompletado (+ `cmp-buffer/path/nvim-lsp`, `lspkind`) | `nvim-cmp.lua` |
| `L3MON4D3/LuaSnip` + `friendly-snippets` | Motor y colección de snippets | `nvim-cmp.lua` |

### ✍️ Edición

| Plugin | Propósito | Spec |
|---|---|---|
| `numToStr/Comment.nvim` | Comentar código (+ `nvim-ts-context-commentstring`) | `comment.lua` |
| `kylechui/nvim-surround` | Rodear con pares (`( )`, `" "`, tags…) | `surround.lua` |
| `windwp/nvim-autopairs` | Cierre automático de pares | `autopairs.lua` |
| `windwp/nvim-ts-autotag` | Cierre automático de tags HTML/JSX | `autotag.lua` |
| `mg979/vim-visual-multi` | Multicursor | `multi-line.lua` |
| `chrisgrieser/nvim-rip-substitute` | Buscar/reemplazar con preview (ripgrep) | `rip.lua` |
| `Wansmer/treesj` | Split / join de objetos y arrays | `treesj.lua` |

### 🌳 Sintaxis, formato y lint

| Plugin | Propósito | Spec |
|---|---|---|
| `nvim-treesitter/nvim-treesitter` | Parsing y resaltado (`auto_install` de parsers activo) | `treesitter.lua` |
| `stevearc/conform.nvim` | Formateo de código | `formatting.lua` |
| `mfussenegger/nvim-lint` | Linting | `linting.lua` |

### 🐙 Git

| Plugin | Propósito | Spec |
|---|---|---|
| `lewis6991/gitsigns.nvim` | Signos de git, hunks y blame | `gitsigns.lua` |
| `kdheepak/lazygit.nvim` | LazyGit integrado | `lazygit.lua` |

### 🚦 Diagnósticos y TODOs

| Plugin | Propósito | Spec |
|---|---|---|
| `folke/trouble.nvim` | Lista de diagnósticos | `trouble.lua` |
| `folke/todo-comments.nvim` | Resalta y navega TODOs | `todo-comment.lua` |

### 🤖 IA

| Plugin | Propósito | Spec |
|---|---|---|
| `github/copilot.vim` | Sugerencias de Copilot | `copilot.lua` |
| `CopilotC-Nvim/CopilotChat.nvim` | Chat con Copilot | `copilot-chat.lua` |

### 🗂️ Sesiones y base

| Plugin | Propósito | Spec |
|---|---|---|
| `rmagatti/auto-session` | Sesiones automáticas por directorio | `auto-session.lua` |
| `nvim-lua/plenary.nvim` | Librería base (dependencia de varios plugins) | `init.lua` |

---

> 💡 Pulsa `<leader>` (Space) y espera: **which-key** te muestra en pantalla los atajos disponibles.
