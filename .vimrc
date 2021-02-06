" ===================================
"       Init
" ===================================
" load default.vim
source $VIMRUNTIME/defaults.vim
" menu bar language
if has("win32")
    set langmenu=none
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif


" ===================================
"       Appearances
" ===================================
" activate status line
set laststatus=2
" display line number
set number
" highlight the text line of the cursor
set cursorline
" the cursor can positioned where there is no actual character
set virtualedit=block
" display the matching bracket
set showmatch matchtime=1

" ***** highlighting a wide space *****
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
" ***** end of highlighting a wide space


" ===============================
"       Fonts
" ===============================
if has("win32")
    set guifont=Consolas:h12:w6
    set guifontwide=MS_Gothic
endif


" ===============================
"       Tab
" ===============================
" use space instead of tab
set expandtab
" head of a line
set shiftwidth=4
" not head of a line
set tabstop=4
" use smartindent
set smartindent


" ===========================
"       Searching
" ===========================
set incsearch
set hlsearch

" no highlight
nnoremap <F3> :let @/ = ""<CR>


" =================================
"       Language preferences
" =================================
syntax enable
" cpp
" syntax plugin (https://github.com/octol/vim-cpp-enhanced-highlight)
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" build current file (termwinkey = <C-l>)
autocmd Filetype cpp nnoremap <F5> :w <bar> cd %:h <bar> let @f = @% <bar> bo term <CR>g++ -std=c++14 -Wall <C-l>"f<CR> 

" python
" execute current file
autocmd Filetype python nnoremap <F5> <Esc>:w <bar> !python <C-r>%<CR>
let g:python_highlight_exceptions = 1
let g:python_highlight_indent_errors = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1




" ================================
"       Terminal
" ================================
set termwinkey=<C-l>
" keymap
tnoremap <C-P> <C-l>"*
tnoremap <2-RightMouse> <C-l>"*
tnoremap <F9> a.exe<CR><C-l>"*
" move to normal mode
tnoremap <ESC> <C-l>N


" ============================
"       Screen
" ============================
if !exists("s:loaded_vimrc")
    let s:loaded_vimrc = 0
    set lines=40
    set columns=120
endif
" colorscheme morning


" ====================================
"       Window
" ====================================
" where to split window
set splitbelow
set splitright
" split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>


" ====================================
"       Others
" ====================================
" don't use backup
set nobackup
" use clipboard
set clipboard+=unnamed
" encoding
set encoding=utf-8


" ========================================
"       Programming Contest
" ========================================
" use AtCoder_skeleton.cpp when opened .cpp file in AtCoder directory
" then move cursor to main function
augroup ProConSetting
    autocmd!
    autocmd BufNewFile $HOME/**/AtCoder/**/*.cpp 0r $HOME/config_files/vim_template/AtCoder_skeleton.cpp
    autocmd BufNewFile $HOME/**/AtCoder/**/*.cpp :$?{?2
augroup END

