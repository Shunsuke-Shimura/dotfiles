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
"       dein.vim
" ===================================
" install dir 
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein installation check 
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" begin settings 
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " .toml file
    if has("win32")
        let s:rc_dir = expand('~/vimfiles')
    else
        let s:rc_dir = expand('~/.vim')
    endif
    if !isdirectory(s:rc_dir)
        call mkdir(s:rc_dir, 'p')
    endif
    let s:toml = s:rc_dir . '/dein.toml'

    " read toml and cache
    call dein#load_toml(s:toml, {'lazy': 0})

    " end settings
    call dein#end()
    call dein#save_state()
endif

" plugin installation check
if dein#check_install()
      call dein#install()
endif

" plugin remove check 
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
      call map(s:removed_plugins, "delete(v:val, 'rf')")
      call dein#recache_runtimepath()
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

" no highlight
nnoremap <F3> :let @/ = ""<CR>


" =================================
"       Language preferences
" =================================
syntax enable
" cpp syntax plugin (https://github.com/octol/vim-cpp-enhanced-highlight)
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1


" ================================
"       Terminal Setting
" ================================
set termwinkey=<C-l>
" keymap
tnoremap <C-P> <C-l>"*
tnoremap <2-RightMouse> <C-l>"*
tnoremap <F9> a.exe<CR><C-l>"*
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

" ========================================
"       Programming Contest
" ========================================
" build current file (termwinkey = <C-l>)
nnoremap <F5> :w <bar> cd %:h <bar> let @f = @% <bar> bo term <CR>g++ -std=c++14 -Wall <C-l>"f<CR> 

" use AtCoder_skeleton.cpp when opened .cpp file in AtCoder directory
" then move cursor to main function
augroup ProConSetting
    au!
    au BufNewFile $HOME/**/AtCoder/**/*.cpp :0r $HOME/config_files/vim_template/AtCoder_skeleton.cpp
    au BufNewFile $HOME/**/AtCoder/**/*.cpp :$?{?2
augroup END




