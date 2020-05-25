let mapleader = "," 
" --------------Vundle Starts-------------------------

set nocompatible              " be iMproved, required
filetype off                  " required <<========== We can turn it on later

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" <============================================>
" Specify plugins you want to install here.

"https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide 
" Plugin 'ycm-core/YouCompleteMe'

" Install plasticboy/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-commentary'

" https://vimawesome.com/plugin/vim-superman-superman
Plugin 'jez/vim-superman'

" https://wakatime.com/vim
Plugin 'wakatime/vim-wakatime'

" https://vimawesome.com/plugin/vim-airline-superman
Plugin 'vim-airline/vim-airline'

" https://github.com/preservim/nerdtree
Plugin 'preservim/nerdtree'

Plugin 'tpope/vim-fugitive'

Plugin 'kien/ctrlp.vim'   

Plugin 'terryma/vim-expand-region'



" <============================================>
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"----------------Vundle ends here  ---------------------------

"-- ----- auto generate by Vim 8.0 ---------------------

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Oct 27
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

syntax on

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" -------------------My own configuration starts here--------------


" https://stackoverflow.com/a/37866336/5984709
" Close all buffers execept the current one
function! DiffOff()
  let NERDTree = 0
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    let NERDTree = 1
  endif
  execute ":diffoff | only"
  if NERDTree == 1
    execute ":NERDTreeToggle | wincmd p"
  endif
endfunction

" Then enter :DiffOff to close the diff windows.
" https://stackoverflow.com/a/44149435/598479
if !exists(":DiffQuit")
  command DiffQuit call DiffOff()
endif

" Double ESC to clear previous searching highlight
nnoremap <silent> <Esc><Esc> :let @/=""<CR>


" Change the search highlighting background color
set hlsearch
hi Search ctermbg=Red


" when indenting with >, use 2 spaces width 
set shiftwidth=2
" On pressing tab, using spaces instead
set expandtab
" set the number of spaces a tab counts for 
set tabstop=2


" Remove swap,backup and undo files from working diretory
" This puts those files out of sight (and out of your way), but doesn't turn them off entirely.
" https://medium.com/@Aenon/vim-swap-backup-undo-git-2bf353caa02f 
" set backupdir=.backup/,~/.backup/,~/vimtmp//
set backupdir=~/vimtmp//
" set directory=.swp/,~/.swp/,~/vimtmp//
set directory=~/vimtmp//
" set undodir=.undo/,~/.undo/,~/vimtmp//
set undodir=~/vimtmp//

" Disable vim markdown auto-folding
let g:vim_markdown_folding_disabled = 1

" Enable a man page viewr inside vim, so that we can use man in vim
" use "Man" to invoke. 
" e.g. :Man 3 printf
runtime! ftplugin/man.vim

set number                     " Show current line number
set relativenumber             " Show relative line numbers

let g:NERDTreeWinSize = 30    " Set the width of NERDTree



" Use the right side of the screen
" https://vim.fandom.com/wiki/Script:3619
let g:buffergator_viewport_split_policy = 'R'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" Use the airline tabline to show buffers
let g:airline#extensions#tabline#enabled = 1
" show buffer number instead index
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" https://vi.stackexchange.com/a/21925
" Show terminal buffer in tabline in nvim
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" Basic Configuration for ctrip.vim
" http://ctrlpvim.github.io/ctrlp.vim/#installation
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

" Help change working directory
" https://github.com/kien/ctrlp.vim/issues/150
let g:ctrlp_working_path_mode = 0 


" move around the buffer list
nnoremap gn :bn<cr>
nnoremap gN :bp<cr>
nnoremap gp :b#<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" idea from https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>wq :w<CR>:bp <BAR> bd #<CR>


" diplay list and invoke the `:buffer`
:nnoremap <leader>ls :ls<CR>:b<Space>

" keybinding for ctrlp
nnoremap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>bf :CtrlP<cr>
nnoremap <leader>bm :CtrlPMRU<cr>


" ---------------------------

" https://vimawesome.com/plugin/vim-expand-region
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1, 
      \ 'ib'  :1, 
      \ 'iB'  :1, 
      \ 'il'  :0, 
      \ 'ip'  :0,
      \ 'ie'  :0, 
      \ }

" https://stackoverflow.com/a/29140828/5984709
set wrap linebreak nolist " soft wrap line on non-word
set formatoptions=l " prevents when new/edited lines, don't auto break line


" https://stackoverflow.com/questions/7692233/nerdtree-reveal-file-in-tree
" reveal current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<bar>wincmd p<CR>
" triggle NERDTree
nnoremap <leader>nt :NERDTreeToggle<bar>wincmd p<CR>

" https://stackoverflow.com/a/37866336/5984709
" Close all buffers execept the current one
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")
  let NERDTree = 0
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    let NERDTree = 1
  endif
  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
  if NERDTree == 1
    execute ":NERDTreeFind | wincmd p"
  endif
endfunction

if !exists(":OnlyB")
  command! OnlyB call CloseAllBuffersButCurrent()<CR>
endif  

" https://vi.stackexchange.com/a/6966
" Press ESC to exit terminal simulator mode for nvim
tnoremap <Esc><Esc> <C-\><C-n>

" change style of tab/buffer in the upper
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" show hidden files by default
let NERDTreeShowHidden=1

" open terminal
if !exists(":T")
  command! T split | term
endif

if !exists(":VT")
  command! VT vsplit | term
endif


