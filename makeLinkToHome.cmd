rem HOMEディレクトリへのシンボリックリンクを作成
@echo off
setlocal
mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\config_files\.vimrc
echo 処理を終了します。
