" =========================================
"       modified defaults.vim
" =========================================
if &compatible
  set nocompatible
endif
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
" keep 100 lines of command line history
set history=100		
" show the cursor position all the time
set ruler		
" display incomplete commands
set showcmd		
" display completion matches in a status line
set wildmenu		
" time out for key codes
set ttimeout		
" wait up to 100ms after Esc for special key
set ttimeoutlen=100	

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

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

" =======================================
"       Functions
" =======================================
function! GoToTerm()
    let termbufli = term_list()
    if termbufli == []
        bo terminal
    else
        call bufwinid(termbufli[0])->win_gotoid()
        if mode() =~ "^n"
            normal! i
        endif
    endif
endfunction

" ===================================
"       for win32
" ===================================
" menu bar language
if has("win32")
    set langmenu=none
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif
" gui fonts
if has("win32")
    set guifont=Consolas:h13:w7
    set guifontwide=MS_Gothic
endif


" ===================================
"       Appearances
" ===================================
" screen size
if !exists("s:loaded_vimrc")
    let s:loaded_vimrc = 0
    set lines=40
    set columns=120
endif
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
"       Editing
" ===============================
" tab key
set expandtab " use space instead of tab
set shiftwidth=4 " head of a line
set tabstop=4 " not head of a line
set smartindent
" make undo checkpoint before using CTRL-u 
inoremap <C-U> <C-G>u<C-U>

" ===========================
"       Searching
" ===========================
set incsearch
set hlsearch
" reset highlight
nnoremap <F2> :let @/=""<CR>


" =================================
"       Language preferences
" =================================
syntax enable
" cpp
" syntax plugin 
" https://github.com/octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" build current file (termwinkey = <C-l>)
autocmd Filetype cpp nnoremap <F5> :w <bar> let @f = @% <bar> call GoToTerm()<CR>
                                    \g++ -std=c++14 -Wall <C-l>"f<CR>

" python
" execute current file
autocmd Filetype python nnoremap <F5> <Esc>:w <bar> !python <C-r>%<CR>
" syntax plugin
" https://github.com/vim-python/python-syntax
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


" ====================================
"       Window
" ====================================
" where to split window
set splitbelow
set splitright
" window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>


" ====================================
"       vim-plug
" ====================================
if has("win32")
    let g:plugged_dir='~/vimfiles/plugged'
else
    let g:plugged_dir='~/.vim/plugged'
endif

call plug#begin(g:plugged_dir)
    
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

call plug#end()


" ====================================
"       Plugins
" ====================================
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" airline
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1


" ====================================
"       Others
" ====================================
" don't use backup
set nobackup
" use clipboard
set clipboard+=unnamed
" encoding
set encoding=utf-8
map Q gq


" ========================================
"       Programming Contest
" ========================================
" use AtCoder_skeleton.cpp when opened .cpp file in AtCoder directory
" then move cursor to main function
let g:procon_library_dir_path="$HOME/procon_library/"
augroup ProConSkeleton
    autocmd!
    autocmd BufNewFile $HOME/**/AtCoder/**/*.cpp 0r $HOME/dotfiles/vim_template/AtCoder_skeleton.cpp
    autocmd BufNewFile $HOME/**/AtCoder/**/*.cpp :$?{?2
augroup END
augroup ProConSetting
    autocmd!
    autocmd BufNewFile,BufRead $HOME/**/AtCoder/**/*.cpp :syntax keyword cppType ll P
    autocmd BufNewFile,BufRead $HOME/**/AtCoder/**/*.cpp :command! -range -buffer -nargs=1 Read :exe '<line1>read ' . expand(g:procon_library_dir_path) . "<args>"
augroup END


" ========================================
"       Syntax Checker
" ========================================
function! s:get_syn_id(transparent)
    let synid = synID(line("."), col("."), 1)
    if a:transparent
        return synIDtrans(synid)
    else
        return synid
    endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
