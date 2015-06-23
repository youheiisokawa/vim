" let g:molokai_original = 1
" colorscheme molokai
colorscheme twilight

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 現在ディレクトリを、バッファで開いているファイルが存在しているディレクトリに
" 自動的に置き換え
"set autochdir
" ステータスラインにファイルのバスと現在の文字コード等を出す
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" フォント設定
" フォント名に日本語名を使うので、一時的に文字コードを変える
"set encoding=cp932
"set guifont=Consolas:h11
"set guifontwide=MS_Gothic:h11:cSHIFTJIS
if (has('gui_macvim'))
	" set guifont=Consolas:h15
	set guifont=Source_Han_Code_JP:h14
	" set guifontwide=Ricty:h15
	set guifontwide=Source_Han_Code_JP:h14
else
	set guifont=Consolas:h11
	set guifontwide=MS_Gothic:h11:cSHIFTJIS
end

set ambiwidth=double
" 文字コードを元に戻す
set encoding=utf-8
" 文字化け回避
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim
" 上下最低２行を残してウィンドウをスクロールさせる
set scrolloff=2
" 左右最低三文字を残してウィンドウをスクロールさせる
set sidescrolloff=3
" ツールバーを消す
set guioptions-=T
" 折り返されている行の頭に++++を表示
set showbreak=++++

" 透過設定
"gui
"set transparency=220
" ウインドウの幅
set columns=120
" ウインドウの高さ
set lines=60
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

" 指定した文字コードで開きなおすコマンド群
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2202-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis ++enc=cp932
" 開いているバッファの文字コードを変えるコマンド群
command! ChgencCp932 set fenc=cp932
command! ChgencEucjp set fenc=euc-jp
command! ChgencIso2022jp set fenc=iso-2202-jp
command! ChgencUtf8 set fenc=utf-8
command! ChgencJis ChgencIso2022jp
command! ChgencSjis set fenc=cp932

