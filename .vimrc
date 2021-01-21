"***** 初期設定 *****
" まずデフォルトファイルを読み込む 
source $VIMRUNTIME/defaults.vim
" エンコーディングの設定
set encoding=utf-8
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
set expandtab
" 行頭以外のTab文字の表示幅
set tabstop=4
" 行頭でのTab文の表示幅
set shiftwidth=4
" スマートインデント
set smartindent


"***** 検索系 *****
" インクリメントサーチ
set incsearch
" 検索結果をハイライト
set hlsearch


"***** 各言語系 *****
" シンタックス
syntax enable


"***** Terminal系 *****
" Cntl-Pでクリップボードから入力
" 右クリック2回でクリップボードから入力
tnoremap <C-P> <C-w>"*
tnoremap <2-RightMouse> <C-w>"*


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

"***** Programming Contest Setting ****
" /AtCoder以下の.cppファイルを開いたときにテンプレートをbufferに書き出す
" main関数の1行目に移動
augroup ProConSetting
    au!
    au BufNewFile $HOME/**/AtCoder/**/*.cpp 0r $VIM/template/procon_template.cpp
    au BufNewFile $HOME/**/AtCoder/**/*.cpp $?{?2
augroup END

