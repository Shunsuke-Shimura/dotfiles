" ===================================
"      Init
" ===================================

" load default.vim
source $VIMRUNTIME/defaults.vim
" don't use backup
set nobackup
" use clipboard
set clipboard+=unnamed
" encoding
set encoding=utf-8


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
  autocmd VimEnter, WinEnter * match IdeographicSpace /　/
augroup END
" ***************************************


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


" =================================
"       Language preferences
" =================================

syntax enable


" ================================
"       Terminal Setting
" ================================
" keymap
tnoremap <C-P> <C-w>"*
tnoremap <2-RightMouse> <C-w>"*



" ============================
"       Screen
" ============================

set lines=40
set columns=120
colorscheme morning

" ========================================
"       Programming Contest
" ========================================

" use AtCoder_skeleton.cpp when opened .cpp file in AtCoder directory
" then move cursor to main function
augroup ProConSetting
    au!
    au BufNewFile $HOME/**/AtCoder/**/*.cpp 0r $HOME/config_files/vim_template/AtCoder_skeleton.cpp
    au BufNewFile $HOME/**/AtCoder/**/*.cpp $?{?2
augroup END

