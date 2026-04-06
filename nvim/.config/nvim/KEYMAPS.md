# Neovim Keymaps — Perfil `may`

Leader key: `Space`

---

## General

| Atajo | Modo | Acción |
|-------|------|--------|
| `jk` | Insert | Salir de insert mode |
| `<leader>nh` | Normal | Limpiar highlights de búsqueda |
| `<Enter>` | Normal | Insertar línea abajo sin entrar en insert |
| `<Shift+Enter>` | Normal | Insertar línea arriba sin entrar en insert |
| `<leader>\`` | Normal | Alternar entre archivo actual y anterior |
| `<leader>cp` | Normal | Copiar ruta relativa del archivo actual al clipboard |

---

## Formato

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>f` | Normal / Visual | Formatear archivo o selección (conform.nvim) |

---

## Ventanas (Splits)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>sv` | Normal | Split vertical |
| `<leader>sh` | Normal | Split horizontal |
| `<leader>se` | Normal | Igualar tamaño de splits |
| `<leader>sx` | Normal | Cerrar split actual |

---

## Tabs

| Atajo | Modo | Acción |
|-------|------|--------|
| `<Tab>` | Normal | Siguiente buffer/tab |
| `<S-Tab>` | Normal | Buffer/tab anterior |
| `<leader>to` | Normal | Abrir nuevo tab |
| `<leader>tx` | Normal | Cerrar tab actual |
| `<leader>tn` | Normal | Ir al siguiente tab |
| `<leader>tp` | Normal | Ir al tab anterior |
| `<leader>tf` | Normal | Abrir buffer actual en nuevo tab |

---

## File Explorer (nvim-tree)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>ee` | Normal | Toggle explorador de archivos |
| `<leader>ef` | Normal | Toggle explorador en el archivo actual |
| `<leader>ec` | Normal | Colapsar explorador |
| `<leader>er` | Normal | Refrescar explorador |

---

## Telescope (Búsqueda)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>ff` | Normal | Buscar archivos en el proyecto |
| `<leader>fr` | Normal | Buscar archivos recientes |
| `<leader>fs` | Normal | Buscar texto en el proyecto (live grep) |
| `<leader>fc` | Normal | Buscar palabra bajo el cursor en el proyecto |
| `<leader>ft` | Normal | Buscar TODOs |
| `<C-k>` | Telescope Insert | Resultado anterior |
| `<C-j>` | Telescope Insert | Resultado siguiente |
| `<C-q>` | Telescope Insert | Enviar selección a quickfix list |

---

## Harpoon (Navegación rápida)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>h` | Normal | Agregar archivo actual a Harpoon |
| `<leader>a` | Normal | Abrir menú de Harpoon |
| `<leader>1` | Normal | Ir al archivo 1 de Harpoon |
| `<leader>2` | Normal | Ir al archivo 2 de Harpoon |
| `<leader>3` | Normal | Ir al archivo 3 de Harpoon |
| `<leader>4` | Normal | Ir al archivo 4 de Harpoon |
| `<leader>5` | Normal | Ir al archivo 5 de Harpoon |

---

## LSP (activo al abrir un archivo con servidor)

| Atajo | Modo | Acción |
|-------|------|--------|
| `gR` | Normal | Ver referencias (Telescope) |
| `gD` | Normal | Ir a declaración |
| `gd` | Normal | Ver definiciones (Telescope) |
| `gi` | Normal | Ver implementaciones (Telescope) |
| `gt` | Normal | Ver type definitions (Telescope) |
| `K` | Normal | Mostrar documentación del símbolo |
| `<leader>ca` | Normal / Visual | Ver code actions |
| `<leader>rn` | Normal | Renombrar símbolo en **todo el proyecto** (workspace rename via LSP) |
| `<leader>D` | Normal | Diagnósticos del buffer (Telescope) |
| `<leader>d` | Normal | Diagnóstico de la línea actual |
| `[d` | Normal | Ir al diagnóstico anterior |
| `]d` | Normal | Ir al diagnóstico siguiente |
| `<leader>rs` | Normal | Reiniciar LSP |

### Renombrar solo en el archivo actual
Usar la sustitución nativa de Vim: `:%s/nombre_viejo/nombre_nuevo/gc`
- Sin `c`: reemplaza todo sin confirmar
- Con `c`: confirma cada reemplazo uno a uno

### Renombrar en todo el proyecto (sin LSP)
1. `<leader>fs` → live grep para encontrar el texto
2. `<C-q>` → enviar resultados a quickfix list
3. `:cfdo %s/viejo/nuevo/g | update` → reemplazar en todos los archivos de la lista

---

## Git (LazyGit + Gitsigns)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>gg` | Normal | Abrir LazyGit |

---

## Trouble (Diagnósticos)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>xx` | Normal | Toggle lista de problemas |
| `<leader>xw` | Normal | Diagnósticos del workspace |
| `<leader>xd` | Normal | Diagnósticos del documento |
| `<leader>xq` | Normal | Quickfix list |
| `<leader>xl` | Normal | Location list |
| `<leader>xt` | Normal | TODOs en Trouble |

---

## Sesiones (auto-session)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>wr` | Normal | Restaurar sesión del directorio actual |
| `<leader>ws` | Normal | Guardar sesión actual |

---

## Folds (requiere parser de treesitter instalado para el filetype)

Los folds usan `foldmethod=expr` con treesitter — se generan automáticamente según la estructura del código.
Los archivos abren con folds desactivados (`foldenable=false`). Actívalos con `zM` o `zi`.

| Atajo | Modo | Acción |
|-------|------|--------|
| `za` | Normal | Toggle fold bajo el cursor |
| `zo` | Normal | Abrir fold |
| `zc` | Normal | Cerrar fold |
| `zR` | Normal | Abrir todos los folds del buffer |
| `zM` | Normal | Cerrar todos los folds del buffer |
| `zi` | Normal | Toggle habilitar/deshabilitar folds |

---

## Surround (nvim-surround)

| Comando | Acción | Ejemplo |
|---------|--------|---------|
| `ysiw)` | Rodear palabra con `()` | `word` → `(word)` |
| `ys$"` | Rodear hasta fin de línea con `""` | `text` → `"text"` |
| `cs'"` | Cambiar `'` por `"` | `'text'` → `"text"` |
| `ds]` | Eliminar `[]` alrededor | `[text]` → `text` |
| `dst` | Eliminar tag HTML alrededor | `<b>text</b>` → `text` |
| `csth1<CR>` | Cambiar tag por `<h1>` | `<b>text</b>` → `<h1>text</h1>` |

---

## TreeSJ (split/join bloques)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<Space>m` | Normal | Toggle split/join del bloque |
| `<Space>j` | Normal | Join (unir en una línea) |
| `<Space>s` | Normal | Split (expandir a múltiples líneas) |

---

## Marks (chentoast/marks.nvim)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>m` | Normal | Toggle mark en línea actual |
| `m,` | Normal | Siguiente mark |
| `m.` | Normal | Mark anterior |
| `m;` | Normal | Preview de mark |
| `m-` | Normal | Eliminar marks del buffer |

---

## Terminal

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader><ESC>` | Terminal | Salir de terminal mode (volver a Normal) |

---

## Copilot (Insert mode)

Las sugerencias aparecen como ghost text mientras escribes.

| Atajo | Modo | Acción |
|-------|------|--------|
| `<C-l>` | Insert | Aceptar sugerencia de Copilot |
| `<C-]>` | Insert | Siguiente sugerencia |
| `<C-[>` | Insert | Sugerencia anterior |
| `<C-\>` | Insert | Descartar sugerencia |

> Primera vez: ejecutar `:Copilot setup` para autenticarse con GitHub.

---

## nvim-cmp (Autocompletado — Insert mode)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<C-k>` | Insert | Selección anterior en el menú |
| `<C-j>` | Insert | Selección siguiente en el menú |
| `<C-Space>` | Insert | Forzar apertura del menú |
| `<C-b>` | Insert | Scroll docs hacia arriba |
| `<C-f>` | Insert | Scroll docs hacia abajo |
| `<C-e>` | Insert | Cerrar menú de autocompletado |
| `<CR>` | Insert | Confirmar selección |

---

## Acentos en español (Insert mode)

| Atajo | Resultado |
|-------|-----------|
| `Opt + a` | á |
| `Opt + e` | é |
| `Opt + i` | í |
| `Opt + o` | ó |
| `Opt + u` | ú |
| `Opt + n` | ñ |
| `Opt + A` | Á |
| `Opt + E` | É |
| `Opt + I` | Í |
| `Opt + O` | Ó |
| `Opt + U` | Ú |
| `Opt + N` | Ñ |
| `Opt + ?` | ¿ |
| `Opt + !` | ¡ |
