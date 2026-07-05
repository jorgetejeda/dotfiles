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
| `<CR>` (Enter) | normal | Insertar línea abajo sin entrar a insert |
| `<S-CR>` (Shift+Enter) | normal | Insertar línea arriba sin entrar a insert |
| `<leader>\`` | normal | Alternar entre archivo actual y anterior |
| `<leader>cp` | normal | Copiar ruta relativa del archivo al portapapeles |
| `<leader><ESC>` | terminal | Salir del modo terminal |
| `za` | normal | Toggle fold bajo el cursor |
| `<Esc>f` | normal/visual | Formatear código (conform) |

**Folds:** `zc` cerrar · `zo` abrir · `za` toggle · `zR` abrir todos · `zM` cerrar todos.

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

---

## 🐙 Git

**Gitsigns** (gitsigns.lua):

| Tecla | Acción |
|---|---|
| `<leader>gb` | Blame de la línea (float) |
| `<leader>gB` | Blame de la línea (commit completo) |
| `<leader>gbl` | Panel de blame (navegar commits) |
| `<leader>hn` / `<leader>hp` | Hunk siguiente / anterior |
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

> ⚠️ **Nota:** `<leader>a` y `<leader>h` colisionan con claude-code (`<leader>a`) e image-preview (`<leader>p`)/harpoon. El último plugin cargado gana — revisa si Harpoon o Claude Code responde según el orden de carga.

---

## 🤖 Claude Code (claude-code.lua)

| Tecla | Acción |
|---|---|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume Claude |
| `<leader>aC` | Continue Claude |
| `<leader>am` | Seleccionar modelo |
| `<leader>ab` | Agregar buffer actual |
| `<leader>as` | Enviar selección (visual) / agregar archivo (árbol) |
| `<leader>aa` / `<leader>ad` | Aceptar / rechazar diff |
| `<leader>at` | Continuar conversación reciente |
| `<leader>av` | Logging verbose |

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

**Comment.nvim** (comment.lua): `gcc` comentar línea · `gc` (visual) comentar selección · `gbc` comentar en bloque.

**vim-multiple-cursors** (multi-line.lua, ver which-key):

| Tecla | Acción |
|---|---|
| `<C-n>` | Iniciar/siguiente multicursor en la palabra |
| `<C-p>` | Quitar última selección |
| `<C-x>` | Saltar coincidencia |
| `g<C-n>` | Multicursor en posición exacta |

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

> 💡 Pulsa `<leader>` (Space) y espera: **which-key** te muestra en pantalla los atajos disponibles.
