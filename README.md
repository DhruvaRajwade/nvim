## This is a mainly python-focused config, with a slightly different version in the remote branch, meant for remote systems (such as ancient slurm servers) with no sudo access

## Plugins Overview

Here’s a rundown of the main plugins I use in this config and what role each plays in my workflow:

- **[blink.cmp](https://github.com/Saghen/blink.cmp)** – I've added Copilot as a source here, instead of `ghost` in-line suggestions

- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** – Autocompletes an assortment of parantheses

- **[barbar.nvim](https://github.com/romgrk/barbar.nvim)** - The status bar (bottom)

- **[conform.nvim](https://github.com/stevearc/conform.nvim)** – For code formatting

- **[flash.nvim](https://github.com/folke/flash.nvim)** – Makes moving around text way faster.

- **[img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim)** – I often need to drop screenshots or figures into Markdown/notes. This plugin lets me just paste from the clipboard and it handles saving and linking the image. Zero friction.

- **[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)** Folding code

- **[oil.nvim](https://github.com/stevearc/oil.nvim)** – Files as a buffer

- **[persistence.nvim](https://github.com/folke/persistence.nvim)** – Session management

- **[trouble.nvim](https://github.com/folke/trouble.nvim)** – Organized reasons why your code might suck

- **[yanky.nvim](https://github.com/gbprod/yanky.nvim)** - Better yanking and yeeting

- #NOTE: Some extra stuff like debugging support can be found in the `lua/plugins/archive` directory (not enabled by default)

#### TODO

- [ ] Actually learn to use neovim
- [x] Set up Which-Key properly
- [x] DAP: Set up and learn debugging
- [x] Option to open config dir on homepage
- [x] Set up folding (maybe nvim-ufo?)
- [x] Set up [flash.nvim](https://github.com/folke/flash.nvim)
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
- Vim-Surround: In Visual mode, to surround a selection type `S<delimiter>`
- `<leader>td` is set to toggle todo-list
