<!--toc:start-->

- [📝 Deez Nuts](#📝-deez-nuts)
  - [📁 Directory Structure](#📁-directory-structure)
    - [Yanky Keymaps](#yanky-keymaps)
    - [Better Up/Down Movement](#better-updown-movement)
    - [Window Navigation](#window-navigation)
    - [Window Resizing](#window-resizing)
    - [Move Lines](#move-lines)
    - [Buffers](#buffers)
    - [Search Enhancements (saner n/N)](#search-enhancements-saner-nn)
    - [Undo Breakpoints](#undo-breakpoints)
    - [Save](#save)
    - [Commenting](#commenting)
    - [Quit](#quit)
    - [Window Management](#window-management)
    - [Zen Mode](#zen-mode)
    - [Terminal](#terminal)
    - [Line Number Toggle](#line-number-toggle)
    - [Clipboard Operations](#clipboard-operations)
    - [Diagnostics](#diagnostics)
      - [Notes about changes (with dates)](#notes-about-changes-with-dates)
        - [30 May:](#30-may)
      - [Notes for specific plugins](#notes-for-specific-plugins)
      - [TODO](#todo)
- [Learning vim: Notes](#learning-vim-notes) - [General Stuff](#general-stuff) - [Navigation](#navigation) - [Actions](#actions) - [Horizontal Motions](#horizontal-motions) - [Vertical Motions](#vertical-motions) - [Searching](#searching) - [Advanced Motions](#advanced-motions)
<!--toc:end-->

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

### 🔁 Yanky Keymaps

| Keybinding | Mode(s) | Description          |
| ---------- | ------- | -------------------- |
| `p`        | n, x    | Yanky Put After      |
| `P`        | n, x    | Yanky Put Before     |
| `gp`       | n, x    | Yanky GPut After     |
| `gP`       | n, x    | Yanky GPut Before    |
| `<C-p>`    | n       | Yanky Previous Entry |
| `<C-n>`    | n       | Yanky Next Entry     |

### ⬇️ Better Up/Down Movement

| Keybinding    | Mode(s) | Description           |
| ------------- | ------- | --------------------- |
| `j`, `<Down>` | n, x    | Down (gj if no count) |
| `k`, `<Up>`   | n, x    | Up (gk if no count)   |

### 🪟 Window Navigation

| Keybinding | Mode | Description        |
| ---------- | ---- | ------------------ |
| `<C-h>`    | n    | Go to Left Window  |
| `<C-j>`    | n    | Go to Lower Window |
| `<C-k>`    | n    | Go to Upper Window |
| `<C-l>`    | n    | Go to Right Window |

### 🪟 Window Resizing

| Keybinding    | Mode | Description          |
| ------------- | ---- | -------------------- |
| `<C-Up>`      | n    | Increase Height      |
| `<C-Down>`    | n    | Decrease Height      |
| `<C-Left>`    | n    | Decrease Width       |
| `<C-Right>`   | n    | Increase Width       |
| `<C-Up/Down>` | t    | Resize from terminal |

### 🔃 Move Lines

| Keybinding | Mode(s) | Description |
| ---------- | ------- | ----------- |
| `<A-j>`    | n, i, v | Move Down   |
| `<A-k>`    | n, i, v | Move Up     |

### 📁 Buffers

| Keybinding                 | Mode | Description            |
| -------------------------- | ---- | ---------------------- |
| `<S-h>`                    | n    | Previous Buffer        |
| `]b`                       | n    | Next Buffer            |
| `<leader>bb`, `<leader>\`` | n    | Switch to Other Buffer |

### 🔎 Search Enhancements

| Keybinding | Mode(s) | Description              |
| ---------- | ------- | ------------------------ |
| `n`, `N`   | n, x, o | Smarter next/prev result |

### 🧠 Undo Breakpoints

| Keybinding  | Mode | Description      |
| ----------- | ---- | ---------------- |
| `,` `.` `;` | i    | Adds undo points |

### 💾 Save

| Keybinding | Mode(s)    | Description |
| ---------- | ---------- | ----------- |
| `<C-s>`    | i, x, n, s | Save File   |

### 💬 Commenting

| Keybinding | Mode | Description        |
| ---------- | ---- | ------------------ |
| `gco`      | n    | Comment Below Line |
| `gcO`      | n    | Comment Above Line |

### 🪟 Window Split

| Keybinding   | Mode | Description   |
| ------------ | ---- | ------------- |
| `<leader>-`  | n    | Split Below   |
| `<leader>dw` | n    | Delete Window |

### 🧘 Zen Mode

| Keybinding   | Mode | Description    |
| ------------ | ---- | -------------- |
| `<leader>zz` | n    | Toggle ZenMode |

### 🖥️ Terminal

| Keybinding   | Mode | Description                |
| ------------ | ---- | -------------------------- |
| `<leader>tt` | n    | Toggle Terminal            |
| `<leader>tf` | n    | Toggle Float Terminal      |
| `<leader>th` | n    | Toggle Horizontal Terminal |
| `<leader>tv` | n    | Toggle Vertical Terminal   |
| `<C-x>`      | t    | Escape Terminal Mode       |

### 🧑‍⚕️ Diagnostics

| Keybinding   | Mode | Description               |
| ------------ | ---- | ------------------------- |
| `<leader>ld` | n    | Toggle Inline Diagnostics |

### 🧭 Center Screen Scroll

| Keybinding | Mode | Description               |
| ---------- | ---- | ------------------------- |
| `<C-d>`    | n    | Scroll Half Down & Center |
| `<C-u>`    | n    | Scroll Half Up & Center   |

### 🐙 Git

| Keybinding   | Mode | Description                  |
| ------------ | ---- | ---------------------------- |
| `<leader>gp` | n    | Preview Git Hunk (Gitsigns)  |
| `<leader>gb` | n    | Toggle Line Blame (Gitsigns) |

### 🧬 LSP

| Keybinding   | Mode(s) | Description         |
| ------------ | ------- | ------------------- |
| `K`          | n       | Hover Documentation |
| `gd`         | n       | Go to Definition    |
| `<leader>ca` | n, v    | Code Action         |

### 🔖 Marks

| Keybinding   | Mode | Description      |
| ------------ | ---- | ---------------- |
| `<leader>m`  | n    | Telescope Marks  |
| `<leader>dm` | n    | Delete All Marks |

### 📋 Clipboard

| Keybinding   | Mode(s) | Description                        |
| ------------ | ------- | ---------------------------------- |
| `<leader>y`  | n, v    | Yank to system clipboard           |
| `<leader>yy` | n       | Yank line to system clipboard      |
| `<leader>p`  | n, v    | Paste from system clipboard        |
| `<leader>P`  | n, v    | Paste before from system clipboard |

---

### 🧩 Default Keymaps for `nvim-surround`

| Keybinding         | Mode | Description                 |
| ------------------ | ---- | --------------------------- |
| `ys<motion><char>` | n    | Add surround to text object |
| `yss<char>`        | n    | Surround current line       |
| `yS<char>`         | n    | Surround line (alternative) |
| `ds<char>`         | n    | Delete surrounding          |
| `cs<old><new>`     | n    | Change surrounding          |
| `S<char>`          | v    | Surround visual selection   |

📘 Ref: [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

---

### 🧩 Default Keymaps for `nvim-ufo`

| Keybinding | Mode | Description                    |
| ---------- | ---- | ------------------------------ |
| `zR`       | n    | Open all folds                 |
| `zM`       | n    | Close all folds                |
| `zr`       | n    | Open one level of folds        |
| `zm`       | n    | Close one level of folds       |
| `zK`       | n    | Peek folded lines under cursor |

📘 Ref: [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)

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

##### 30 May:

- After playing around a lot, I have added [harpoon](./lua/plugins/harpoon.lua) and `marks.nvim` (in same the file) for better file navigation |
- I have added [indent-blankline](./lua/plugins/indent-blankline.lua) to show indentation lines | And `nvim-ufo` for better code folding (both in the `indent-blankline.lua` file

##### 1 June:

- Added themery and some themes to allow switching
- Experimented with bufferline but meh I don't think I need it
- Set up [nvim-surround](./lua/plugins/nvim-surround.lua) | Now I can surround text, lines or words with parentheses, quotations and more
-

#### Notes for specific plugins

- About the vimtex plugin

#### TODO

- [ ] Actually learn to use neovim
- [x] Set up Which-Key properly
- [x] DAP: Set up and learn debugging
- [x] Option to open config dir on homepage
- [x] Set up folding (maybe nvim-ufo?)
- [ ] Set up [flash.nvim](https://github.com/folke/flash.nvim)
- [x] Learn macros, learn how to use `treesitter-textobjects`

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

##### Vim Text Objects

- I'm only listing the basic ones I think are super cool
- `f` is the function object picker | So `v-i-f` will change in the function | `c-a-f` will change around the function
- `c` is the class object picker | So `v-i-f` will select stuff inside the class
- To scroll by functions: Press `]-m` to go forward and `[-m` to go backward
- To go to end of functions (the above one goes to the start: Replace `m` with `M`
- For classes, replace `m` with `]` and `M` with [

##### Exercises (Random)

- To add a TODO or a HACK, use the comment+<space> + label (e.g.: -- HACK)
- Vim-Surround: `ys`: Indicates yank-s (as just `s` would mean substitute)
- Vim-Surround: So `ys<motion><delimiter>` would be the way
- Vim-Surround: `cs<target><new>` will change delimiter surrounding cursor
- `<leader>td` is set to toggle todo-list
-
