rem HOMEディレクトリへのシンボリックリンクを作成
@echo off
setlocal
mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\config_files\.vimrc
echo .vimrcのHOMEディレクトリへのシンボリックリンクを作成しました。
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\config_files\.gvimrc
echo .gvimrcのHOMEディレクトリへのシンボリックリンクを作成しました。
