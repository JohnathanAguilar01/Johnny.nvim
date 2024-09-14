vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- sets the line numbers ands sets them to relative
opt.relativenumber = true
opt.number = true

-- tabs & indentations
opt.tabstop = 4 -- sets 2 spaces for tab
opt.shiftwidth = 4 -- sets 2 spaces for indent width
opt.expandtab = true -- sets expand tabs to spaces
opt.autoindent = true -- copy indent from current lines when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- sets it so it ignores case when searching
opt.smartcase = true -- make it if you include mixed case into search, assume you want case sensitive

opt.cursorline = true

-- visual settings
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be either light or dark will be dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace 
opt.backspace = "indent,eol,start" -- allow backspace in indent, wnd of line or insert mode start posistion

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as defalt register

-- window spliting
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

