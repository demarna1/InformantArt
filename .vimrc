" Define the leader character
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Necesary  for lots of cool vim things
set nocompatible

" This shows what you are typing as a command
set showcmd

" Set the colorscheme
colorscheme desert
"set background=dark
highlight Normal ctermfg=gray ctermbg=darkgray

" Turn on search highlighting and be able to remove it
set hlsearch
nmap <leader><cr> :noh<cr>

" Turn on syntax highlighting
syntax enable

" Spaces are better than a tab character
set expandtab
set smarttab

" 1 tab == 4 spaces
set sw=4
set ts=4

" Autoindent, smartindent, and wrap lines
set ai
set si
set wrap

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" Incremental searching is sexy
set incsearch

" Remove Toolbar
if has("gui_running")
   set guioptions-=T
   set guitablabel=%t\ %M
endif

" Useful for tabs
map <leader>tn :tabnew<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

