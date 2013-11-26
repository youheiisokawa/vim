set nocompatible

filetype off

" -----------------------------------------------------------------------
" neobundle.vim: {{{
"
if has('vim_starting')
  if has('win32') || has('win64')
    set runtimepath+=~/vimfiles/bundle/neobundle.vim
    call neobundle#rc(expand('~/vimfiles/bundle/'))
else
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
  endif
endif

" install plugin
NeoBundleFetch 'Shougo/neobundle.vim'
" Original repos on github
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
	\     'windows' : 'make -f make_mingw64.mak',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'unix' : 'make -f make_unix.mak'
	\    },
	\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-qfreplace'

" Unite plugin
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'ujihisa/unite-gem'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/quicklearn'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'kannokanno/unite-todo'

" Text
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'mattn/multi-vim'

" Colorscheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'

" HTML
NeoBundle 'mattn/emmet-vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'
NeoBundle 'digitaltoad/vim-jade'
" CSS
" NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'miripiruni/CSScomb-for-Vim.git'
" Javascript
NeoBundle 'walm/jshint.vim'
" NeoBundle 'JavaScript-syntax'
" NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mklabs/vim-backbone'
" Ruby
NeoBundle 'tpope/vim-rails'

" Other
NeoBundle 'honza/vim-snippets'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'basyura/twibill.vim'
"NeoBundle 'basyura/bitly.vim'
"NeoBundle 'basyura/TweetVim'
"NeoBundle 'tpope/vim-haml'

" vim-scripts repos
NeoBundle 'surround.vim'
NeoBundle 'L9'
NeoBundle 'Quich-Filter'
NeoBundle 'QuickBuf'
NeoBundle 'project.tar.gz'
"TODO
"NeoBundle 'AutoClose'


" それ以外にある git リポジトリにあるプラグイン
" Non git repos
"
" //TODO
"NeoBundle 'tyru/operator-html-escape.vim'
" NeoBundle 'kana/vim-smartchr'
" textobj-indent と textmanip
"}}}

filetype plugin indent on

" Installation check.
NeoBundleCheck

" -----------------------------------------------------------------------
" My setting: {{{

" display

set number
set ruler
set cmdheight=1
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%v%8p
set title
set linespace=1
set showcmd
set wildmenu
set wildmode=list:longest,full

" syntax color
syntax on

" search
set ignorecase
set wrapscan
set hlsearch
" インクリメンタルサーチを行う
set incsearch
set grepprg=grep\ -nH

" edit
set showmatch
set backspace=indent,eol,start
"クリップボードをWindowsと連携
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a
" 横スクロールを出す
set guioptions+=b
command! -nargs=1 -bang -bar -complete=file Rename sav<bang> <args> | call delete(expand('#:p'))

" tab
set tabstop=4
"set softtabstop=4
"?????
"set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap

" indent
"新しい行のインデントを現在行と同じにする
set autoindent
set cindent
" 自動的に括弧を見てインデントしてくれる機能を使わない
set nosmartindent


" tab & line end string display on
set list

" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:»\ ,trail:_,extends:<
"set listchars=eol:$,tab:>\ ,extends:<
"set lcs=tab:>-,eol:$,trail:_,extends:\
"set listchars=tab:>-
"scriptencoding utf-8
"set listchars=tab:≫\ ,trail:-,eol:$


" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=5

" diff
set diffopt=filler,vertical

" window
set splitbelow
set splitright

" Directory
" backup
set backupdir=~/vimbackup
" swap files
set directory=~/vimbackup
" buffer
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer


" highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
set cursorline


" this setting from - "http://archiva.jp/web/tool/how_to_vim_2.html"
" move horizontal direction
nnoremap zl zL
nnoremap zh zH

" move tabs
noremap gh gT
noremap gl gt

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc 新しいタブを一番右に作る
map <silent> [Tag]n :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]l :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]h :tabprevious<CR>


" jkでのカーソルを表示行単位で移動できるように変更
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" <CR>
inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>o
inoremap <C-S-CR> <ESC>O

" 検索結果に移動した時、その位置を画面の中央に変更
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" 検索時、「/」の入力をエスケープする
"cnoremap / getcmdtype() == '/' ? '\/': '/'
" ウィンドウ分割時にウィンドウサイズを調節する。Shiftキー ＋ 矢印キー
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>
" バッファの一覧・移動・削除。QuickBuf使うまでもないときに
"nnoremap bb :b#<CR>
nnoremap bp :bprevious<CR>
nnoremap bn :bnext<CR>
nnoremap bd :bdelete<CR>
" 「最後に編集したテキスト」を選択するキーマップ
nnoremap gc '[v']
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>
" 表示中のバッファをVimスクリプトとみなして再読み込み
nnoremap <Space>r :<C-u>execute "source " expand("%:p")<CR>

" vimrc
" edit "_vimrc", "_gvimrc"
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>
" vimrcとgvimrcを再読み込み
nnoremap <Space>v :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>

" Easy escape. {{{
inoremap jj <ESC>
onoremap jj <ESC>

inoremap j<Space> j
onoremap j<Space> j
"}}}

"" Auto insert brackets.
"inoremap { {}<LEFT>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {{ {
""inoremap {} {}
"inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
"inoremap ( ()<LEFT>
"inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap [ []<LEFT>
"inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" practice <Esc>
noremap <C-c> <Nop>
inoremap <C-c> <Nop>

" Encode
command! -bang -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -nargs=? Sjis edit<bang> ++enc=sjis <args>
command! -bang -nargs=? Euc edit<bang> ++enc=euc-jp <args>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Leader><Leader> ~/

" 現在のファイルをブラウザで開く
noremap <F12> :silent ! start chrome.exe "%:p"<CR>
noremap <Leader>0 :silent ! start firefox.exe "%:p"<CR>
noremap <Leader>9 :silent ! start IEXPLORE.EXE "%:p"<CR>
noremap <Leader>8 :silent ! start Safari.exe "%:p"<CR>

" help shortcut key
nnoremap <C-h>  :<C-u>help<Space>

" 日本語入力切り替え
" 挿入モード終了時にIME状態を保存しない
inoremap <silent> <ESC> <ESC>
inoremap <silent> <C-[> <ESC>

" 「日本語入力固定モード」切替
inoremap <silent> <C-j> <C-^>

" 外部grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"}}}

" -----------------------------------------------------------------------
" augroups: {{{
"
" For noexpandtab
augroup MyAutoCmd
    " reset autocmd-list
    autocmd!

    " If open new-buffer, set expandtab
    "autocmd BufNewFile,BufRead * set expandtab

    " go to file!
    autocmd FileType html,xhtml setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

    " Custom folding
    "autocmd BufEnter * if &filetype == "javascript" | set foldmarker={,} | set foldlevel=3 | set foldcolumn=7 | endif
    "
    " for Sass.vim
    autocmd BufRead,BufNewFile *.sass setfiletype sass

	" grep
	autocmd QuickFixCmdPost vimgrep cw
	autocmd QuickFixCmdPost grep cw

	" read templetes
	if has('win32') || has('win64')
		autocmd BufNewFile *.html 0r ~/vimfiles/templates/tmpl.html
		autocmd BufNewFile *.css 0r ~/vimfiles/templates/css/blank.css
		autocmd BufNewFile *.js 0r ~/vimfiles/templates/js/tmpl.js
	else
		autocmd BufNewFile *.html 0r ~/.vim/templates/tmpl.html
		autocmd BufNewFile *.css 0r ~/.vim/templates/css/blank.css
		autocmd BufNewFile *.js 0r ~/.vim/templates/js/tmpl.js
	endif

	" JavaScript dictionaries
	autocmd FileType javascript :set dictionary=$HOME/vimfiles/dict/javascript.dict,$HOME/vimfiles/dict/jQuery.dict

	" xml, html insert end tag
	autocmd FileType html,xhtml,xml inoremap <buffer> </ </<C-x><C-o>

	" insert "<br />"
	autocmd FileType html,xhtml inoremap <S-CR> <br /><CR>

	" Disable Indent for HTML file
	autocmd FileType html,xhtml set indentexpr&

	" TODO: delete whitespace
	"autocmd BufWritePre * :%s/\s\+$//e

augroup END

" .vimrc auto load
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
				\if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif"
"}}}

" -----------------------------------------------------------------------
" HTML Key Mappings for Typing Character Codes: {{{
"
" |--------------------------------------------------------------------
" |Keys     |Insert   |For  |Comment
" |---------|---------|-----|-------------------------------------------
" |\&       |&amp;    |&    |ampersand
" |\<       |&lt;     |<    |less-than sign
" |\>       |&gt;     |>    |greater-than sign
" |\.       |&middot; |・   |middle dot (decimal point)
" |\?       |&#8212;  |?    |em-dash
" |\2       |&#8220;  |“    |open curved double quote
" |\"       |&#8221;  |”    |close curved double quote
" |\`       |&#8216;  |‘    |open curved single quote
" |\'       |&#8217;  |’    |close curved single quote (apostrophe)
" |\`       |`        |`    |OS-dependent open single quote
" |\'       |'        |'    |OS-dependent close or vertical single quote
" |\<Space> |&nbsp;   |     |non-breaking space
" |---------------------------------------------------------------------
"
" > http://www.stripey.com/vim/html.html
"
"
autocmd BufEnter * if &filetype == "html" | call MapHTMLKeys() | endif
function! MapHTMLKeys(...)
  if a:0 == 0 || a:1 != 0
    inoremap \\ \
    inoremap \& &amp;
    inoremap \< &lt;
    inoremap \> &gt;
    inoremap \. ・
    inoremap \- &#8212;
    inoremap \<Space> &nbsp;
    inoremap \` &#8216;
    inoremap \' &#8217;
    inoremap \2 &#8220;
    inoremap \" &#8221;
    autocmd! BufLeave * call MapHTMLKeys(0)
  else
    iunmap \\
    iunmap \&
    iunmap \<
    iunmap \>
    iunmap \-
    iunmap \<Space>
    iunmap \`
    iunmap \'
    iunmap \2
    iunmap \"
    autocmd! BufLeave *
  endif " test for mapping/unmapping
endfunction " MapHTMLKeys()
"}}}

" -----------------------------------------------------------------------
" matchit.vim: {{{
"
source $VIMRUNTIME/macros/matchit.vim
"}}}

" -----------------------------------------------------------------------
" project.vim: {{{
"

" ファイルが選択されたら、ウィンドウを閉じる
let g:proj_flags = "imstc"

" <Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject

" <Leader>pで、デフォルトのプロジェクトを開く
nmap <silent> <Leader>p :Project<CR>

" プロジェクトを開いた時に、フォールディングを展開した状態にする
autocmd BufAdd .vimprojects silent! %foldopen!

if getcwd() != $HOME
	if filereadable(getcwd(). '/.vimprojects')
		Project .vimprojects
	endif
endif
"}}}

" -----------------------------------------------------------------------
" unite: {{{
" The prefix key
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u :<C-u> -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir<CR>
nnoremap <silent> ,vr :UniteResume<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1

" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UnitebuildClearHighlight<CR>

" unite-grepのバックエンドをagに切り替える
" http://qiita.com/items/c8962f9325a5433dc50d
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

" unite-grepのキーマップ
" 選択した文字列をunite-grep
" https://github.com/shingokatsushima/dotfiles/blob/master/.vimrc
vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>

"}}}

" -----------------------------------------------------------------------
" neocomplcache: {{{

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" Quick Type, ignore neocomplcache.
let g:NeoComplCache_SkipCompletionTime = '0.3'
let g:NeoComplCache_SkipInputTime = '0.1'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'javascript' : expand('~/dict/jQuery.dict'),
    \ 'scheme' : expand('~/.gosh_completions')
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" <C-n>: neocomplcache.
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
"inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" <C-p>: keyword completion.
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
"inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

imap <C-s> <Plug>(neocomplcache_start_unite_snippet)

" <S-TAB>: completion back.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" <C-j>: Vim native-Omni completion.
"inoremap <expr><C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"

" use unite
"imap <C-k> <Plug>(neocomplcache_start_unite_complete)
"imap <C-s>  <Plug>(neocomplcache_start_unite_snippet)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)


" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Snippets Edit commands for NeoComplCache
"nnoremap <Leader>nce :NeoComplCacheEditSnippets

"}}}

" -----------------------------------------------------------------------
" neosnippet: {{{

let bundle = neobundle#get('neosnippet')
function! bundle.hooks.on_source(bundle)
"  imap <silent>L <Plug>(neosnippet_jump_or_expand)
"  smap <silent>L <Plug>(neosnippet_jump_or_expand)
"  xmap <silent>L <Plug>(neosnippet_start_unite_snippet_target)
"  imap <silent>K <Plug>(neosnippet_expand_or_jump)
"  smap <silent>K <Plug>(neosnippet_expand_or_jump)
"  imap <silent>G <Plug>(neosnippet_expand)
"  imap <silent>S <Plug>(neosnippet_start_unite_snippet)
"  xmap <silent>o <Plug>(neosnippet_register_oneshot_snippet)
"  xmap <silent>U <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  let g:neosnippet#enable_snipmate_compatibility = 1

  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Snippets file dir
  if has('win32') || has('win64')
  	let g:neosnippet#snippets_directory = $HOME.'/vimfiles/snippets'
  else
  	let g:neosnippet#snippets_directory = $HOME.'/.vim/snippets'
  endif
endfunction

unlet bundle

nnoremap <silent> [Window]f              :<C-u>Unite neosnippet/user neosnippet/runtime<CR>
"}}}

" -----------------------------------------------------------------------
" vimfiler: {{{
"
" disabled 'safemode'
let g:vimfiler_safe_mode_by_default = 0
" default filer config
let g:vimfiler_as_default_explorer = 1
" default open action
let g:vimfiler_edit_action = 'tabopen'


" enable file edit
set modifiable
set write
"}}}

" -----------------------------------------------------------------------
" vimshell {{{
"
" ,is: シェルを起動
nnoremap <silent> ,is :VimShell<CR>
" ,ipy: pythonを非同期で起動
nnoremap <silent> ,irh :VimShell iexe rhino<CR>
"nnoremap <silent> ,irh :VimShellInteractive rhino<CR>
" ,irb: irbを非同期で起動
"nnoremap <silent> ,irb :VimShellInteractive irb<CR>
" ,ss: 非同期で開いたインタプリタに現在の行を評価させる
"vmap <silent> ,ss :VimShellSendString<CR>
" 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
"nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
"}}}

" -----------------------------------------------------------------------
" vim-smartinput: {{{
" for `ruby`

"call smartinput#map_to_trigger('i', '#', '#', '#')
"call smartinput#define_rule({
"\   'at': '\%#',
"\   'char': '#',
"\   'input': '#{}<Left>',
"\   'filetype': ['ruby'],
"\   'syntax': ['Constant', 'Special'],
"\ })
"}}}

" -----------------------------------------------------------------------
" jslint.vim: {{{
"  - https://github.com/basyura/jslint.vim
"  - :copen -> :cnext ...
" augroup jslint
    " autocmd! jslint
    " autocmd FileType javascript call s:javascript_filetype_settings()
" augroup END

" function! s:javascript_filetype_settings()
  " autocmd BufLeave     <buffer> call jslint#clear()
  " autocmd BufWritePost <buffer> call jslint#check()
  " autocmd CursorMoved  <buffer> call jslint#message()
" endfunction

"}}}

" -----------------------------------------------------------------------
" jshint, syntastic: {{{

let g:syntastic_mode_map = {
\ "mode" : "active",
\ "active_filetypes" : ["javascript", "json"],
\}
"}}}

" -----------------------------------------------------------------------
" html5.vim: {{{
"  - https://github.com/othree/html5.vim
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
"}}}

" -----------------------------------------------------------------------
" QuickBuf: {{{
"  - https://github.com/vim-scripts/QuickBuf
let g:qb_hotkey = "<F2>"
"}}}

" -----------------------------------------------------------------------
" Like :CdCurrent {{{
"  - http://vim-users.jp/2009/09/hack69/
"  - :CD
"
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
"}}}

" -----------------------------------------------------------------------
" vim-indent-guides: {{{
"  - https://github.com/nathanaelkane/vim-indent-guides
"set ts=4 sw=4
let g:indent_guides_enable_on_vim_statup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"}}}

" -----------------------------------------------------------------------
" open-browser: {{{
"  - https://gist.github.com/3668363
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
"}}}

" -----------------------------------------------------------------------
" vim-fugitive: {{{
"  - http://qiita.com/items/4936c4412daa866daf7d
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

" ブランチ名などの補完
" http://qiita.com/items/4936c4412daa866daf7d
"command-line completion
"set wildmenu
"set wildmode=list:longest
"}}}

" -----------------------------------------------------------------------
" NeadCommenter.vim: {{{
let NERDSpaceDelims = 1
" no error message
let NERDShutUp=1
" key mapping
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
nmap ,a <Plug>NERDCommenterAppend
vmap ,a <Plug>NERDCommenterAppend
"}}}

" -----------------------------------------------------------------------
" emmet.vim: {{{
" let g:user_emmet_leader_key = '<c-y>'

let g:user_emmet_settings = {
\	'lang': 'ja',
\	'html': {
\		'indentation': '',
\		'snippets': {
\			'flash': "<object data=\"${cursor}\""
\					." type=\"application/x-shockwave-flash\""
\					." id=\"\" width=\"\" height=\"\">\n"
\					."<param name=\"movie\" value=\"\" />\n</object>",
\			'script:jq': "<script src=\"//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js\" type=\"text/javascript\"></script>",
\		},
\	},
\	'css': {
\		'filters': 'fc'
\	},
\	'scss': {
\		'snippets': {
\			'@if': "@if {\n\t|\n}",
\			'@e': "@else {\n\t|\n}",
\			'@in': "@include |",
\			'@ex': "@extend |",
\			'@mx': "@mixin {\n\t|\n}",
\			'@fn': "@function {\n\t|\n}"
\		}
\	},
\	'javascript': {
\		
\	},
\}

"}}}
