# 📝 Deez Nuts

Welcome to deez nuts! This setup is optimized for [MLDLGLRL] and uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management. The configuration is modular and organized for clarity and scalability.

---

## 📁 Directory Structure

```text
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── options.lua          # Basic settings
│   ├── keymaps.lua          # Custom keybindings
│   ├── autocmd.lua          # Autocommands
│   ├── config/
│   │   └── lazy.lua         # Lazy.nvim plugin manager setup
│   └── plugins/             # Plugin specifications
│
│
└── README.md

```

<details>
<summary><strong>📜 A map of Keymaps</strong></summary>

### Yanky Keymaps

| Keybinding | Mode(s) | Description          |
| ---------- | ------- | -------------------- |
| `p`        | n, x    | Yanky Put After      |
| `P`        | n, x    | Yanky Put Before     |
| `gp`       | n, x    | Yanky GPut After     |
| `gP`       | n, x    | Yanky GPut Before    |
| `<C-p>`    | n       | Yanky Previous Entry |
| `<C-n>`    | n       | Yanky Next Entry     |

### Better Up/Down Movement

| Keybinding    | Mode(s) | Description           |
| ------------- | ------- | --------------------- |
| `j`, `<Down>` | n, x    | Down (gj if no count) |
| `k`, `<Up>`   | n, x    | Up (gk if no count)   |

### Window Navigation

| Keybinding | Mode | Description        |
| ---------- | ---- | ------------------ |
| `<C-h>`    | n    | Go to Left Window  |
| `<C-j>`    | n    | Go to Lower Window |
| `<C-k>`    | n    | Go to Upper Window |
| `<C-l>`    | n    | Go to Right Window |

### Window Resizing

| Keybinding  | Mode | Description            |
| ----------- | ---- | ---------------------- |
| `<C-Up>`    | n    | Increase Window Height |
| `<C-Down>`  | n    | Decrease Window Height |
| `<C-Left>`  | n    | Decrease Window Width  |
| `<C-Right>` | n    | Increase Window Width  |

### Move Lines

| Keybinding | Mode(s) | Description |
| ---------- | ------- | ----------- |
| `<A-j>`    | n, i, v | Move Down   |
| `<A-k>`    | n, i, v | Move Up     |

### Buffers

| Keybinding   | Mode | Description            |
| ------------ | ---- | ---------------------- |
| `<S-h>`      | n    | Previous Buffer        |
| `]b`         | n    | Next Buffer            |
| `<leader>bb` | n    | Switch to Other Buffer |
| `<leader>\`` | n    | Switch to Other Buffer |

### Search Enhancements (saner n/N)

| Keybinding | Mode(s) | Description            |
| ---------- | ------- | ---------------------- |
| `n`        | n, x, o | Next Search Result     |
| `N`        | n, x, o | Previous Search Result |

### Undo Breakpoints

| Keybinding  | Mode | Description         |
| ----------- | ---- | ------------------- |
| `,` `.` `;` | i    | Add Undo Breakpoint |

### Save

| Keybinding | Mode(s)    | Description |
| ---------- | ---------- | ----------- |
| `<C-s>`    | i, x, n, s | Save File   |

### Commenting

| Keybinding | Mode | Description       |
| ---------- | ---- | ----------------- |
| `gco`      | n    | Add Comment Below |
| `gcO`      | n    | Add Comment Above |

### Quit

| Keybinding   | Mode | Description |
| ------------ | ---- | ----------- |
| `<leader>qq` | n    | Quit All    |

### Window Management

| Keybinding   | Mode | Description        |
| ------------ | ---- | ------------------ | ------------------ |
| `<leader>-`  | n    | Split Window Below |
| `<leader>    | `    | n                  | Split Window Right |
| `<leader>wd` | n    | Delete Window      |

### Zen Mode

| Keybinding   | Mode | Description     |
| ------------ | ---- | --------------- |
| `<leader>zz` | n    | Toggle Zen Mode |

### Terminal

| Keybinding               | Mode | Description                |
| ------------------------ | ---- | -------------------------- |
| `<leader>tt`             | n    | Toggle Terminal            |
| `<leader>tf`             | n    | Toggle Floating Terminal   |
| `<leader>th`             | n    | Toggle Horizontal Terminal |
| `<leader>tv`             | n    | Toggle Vertical Terminal   |
| `<C-Up/Down/Left/Right>` | t    | Resize in Terminal Mode    |
| `<C-x>`                  | t    | Escape Terminal Mode       |

### Line Number Toggle

| Keybinding   | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<leader>tn` | n    | Toggle Line Numbers |

### Clipboard Operations

| Keybinding   | Mode(s) | Description                   |
| ------------ | ------- | ----------------------------- |
| `<leader>y`  | n, v    | Yank to System Clipboard      |
| `<leader>yy` | n       | Yank Line to System Clipboard |
| `<leader>p`  | n, v    | Paste from System Clipboard   |
| `<leader>P`  | n, v    | Paste Before from Clipboard   |

### Diagnostics

| Keybinding   | Mode | Description                    |
| ------------ | ---- | ------------------------------ |
| `<leader>dt` | n    | Toggle Diagnostic Virtual Text |

</details>

<details>
<summary><strong>📜 A map of Autocmds</strong></summary>

| Trigger Event(s)          | Pattern/FileType          | Description                              |
| ------------------------- | ------------------------- | ---------------------------------------- |
| `CursorHold`              | `*`                       | Show diagnostics in a floating window    |
| `BufWritePost`            | `*.sh`                    | Make shell scripts executable after save |
| `TextYankPost`            | `*`                       | Briefly highlight yanked text            |
| `BufWritePre`             | `*`                       | Remove trailing whitespace before save   |
| `FocusGained`, `BufEnter` | `*`                       | Auto-reload file if changed externally   |
| `BufReadPost`             | `*`                       | Restore last known cursor position       |
| `FileType`                | `gitcommit`,`text`, `tex` | Enable spell check and line wrapping     |

</details>

#### Notes about changes (with dates)

blah blah

#### Notes for specific plugins

- About the vimtex plugin

#### TODO

- [ ] Actually learn to use neovim
- [ ] Set up Which-Key properly
- [x] DAP: Set up and learn debugging
- [x] Option to open config dir on homepage
- [ ] Set up folding (maybe nvim-ufo?)
- [ ] Learn macros

# Learning vim: Notes

##### General Stuff

- A buffer: The in-memory representation of a file | A buffer is contained in a window | IF you open the same buffer in different window both buffers are the same representation |

- Press `F1` to open help

- LEARN macros: Store, record and replay actions

##### Navigation

- Left: `h` | Right `l` | Up: `k` | Down: `j`

- Skip word forward: `w` | skip word backward: `b` | Skip contiguous text (till whitespace): `W` forward | `B` backward

- `_` or `0`: goes to the beginning | `$`: goes to the end

- Case: Say you want to go up 6 lines: Press `6-k` (Hint: press `<leader>-tn` to toggle relative line numbers

- Insert Mode: Pressing `i` or `a` both go into insert mode, `i`: Enter before cursor | `a`:Enter after cursor

- Visual Line Mode: `Shift-v`: Select a line at a time

- To find file path and current line number: `<C-g>`

##### Actions

- Delete: Press `dd` to delete current line | Press `u` to undo

- Delete: Works with counts and navigation keys (Case: `d-3-j` will delete 3 lines down, and `d-w` will delete the current word if you are on the first letter of the word)
  Visual Mode:`v`| Yank: `y` | Paste: `p` |

- Cut and Paste: Weird behaviour: If you delete a line using `d`, it goes into the same buffer as the yank (`y`) buffer, and if you press `p` after deleting a line it pastes that line you deleted (basically cut and paste)...

- NOTE: This means if you paste a line over another line, the line that was removed will now be pasted the next time you call `p`..

- NOTE: counts work with yank too! So to copy the 5 lines above this, we do `y-5-k` and voila!

- `<C-g>`: Shows full path and location in file

- To manually indent text: `>-4-j` will indent 4 lines below

###### Horizontal Motions

- NOTE: Can combine these: e.g. `d-$` will delete everything from your cursor to the end of the line

- Jump forward to specific character(cursor before) in line: `f-char` | cursor after: `t-char` | to repeat: `;` fwd `,` back

- If your cursor is ahead of something and you want to go back" `F-char`

- With Motions: e.g.: This is a line ... With cursor after this line, `d-F-T` will delete everything till the T in "This"

- `I` goes to beginning of line in INSERT mode | `A` goes to the end of the line in insert mode

- `o`:Make new line, go into INSERT mode | `O`:Make new line above cursor, go into INSERT mode

##### Vertical Motions

- To go to a specific line in your file: `<line>-gg` or `<line>-G`

- Go to start of file: `gg` | End of file: `G`

- Go down half a page and center current line: `<C-d>` | Go Up: `<C-u>`

##### Searching

- Just type `/` and type target word | `n` to next | `N` to previous |

- Reverse search: Just type `?`

- `*`: If you are on a word and want to search its instances

- `%`: To search for matching parentheses (`{/}` or `[/]` or `(/)` (Press once to highlight the partner, and twice to go to the partner)

- The `:s` command: Substitutes stuff | e.g. `:s/old/new` substitutes old string for new
- `:s/old/new/g`: Substitutes all occurences in current line (`g`: global) |
- `:%s/old/new/g`: Substitutes all occurences globally | use `gc` instead of `g`: Asks for confirmation every time

##### Advanced Motions

- To select everything between two parentheses: `v-i-(` or `v-i-)` | NOTE: Same works for `{}/[]` etc.

- To include the parentheses as well: `v-a-(` or `v-a-)`

- Similarly, to yank everything: just replace `v` with `y`: e.g.: `y-a-(` will yank everything in a `(xyz)` including the parentheses

- To open a file whose path is under the cursor: `g-f` | To open a link: `g-x`

- `v-i-b`: Select inside of `()` | `v-i-B`: Select inside of `{}` | To include the brackets: use `a` instead of `i`

- `i`: Inside | `a`: all | `b`: braces | `c`: change
