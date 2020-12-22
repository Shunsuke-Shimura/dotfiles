" まずデフォルトファイルを読み込む 
source $VIMRUNTIME/defaults.vim
" バックアップファイルをつくらない
set nobackup
" クリップボードを用いる
set clipboard+=unnamed


"***** 見た目系 *****
" ステータスラインの有効化
set laststatus=2
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" vimの矩形選択で文字が無くても右へ進める
set virtualedit=block
" 対応する括弧やブレースを表示
set showmatch matchtime=1



"***** Tab系 *****
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅
set tabstop=4
" 行頭でのTab文の表示幅
set shiftwidth=4


"***** 検索系 *****
" インクリメントサーチ
set incsearch
" 検索結果をハイライト
set hlsearch


"***** 各言語系 *****
" シンタックス
syntax enable


"***** 全角文字のハイライト *****
scriptencoding utf-8

augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter, WinEnter * match IdeographicSpace /　/
augroup END

"***** 画面表示 *****
" ウィンドウの縦幅
set lines=40
" ウィンドウの横幅
set columns=120
" カラースキーム
colorscheme morning
