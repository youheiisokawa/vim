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
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-qfreplace'

" Text
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'

" HTML
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'
" CSS
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'miripiruni/CSScomb-for-Vim.git'
" Javascript
NeoBundle 'basyura/jslint.vim'
NeoBundle 'JavaScript-syntax'
"NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mklabs/vim-backbone'
" Other
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'mattn/webapi-vim'
NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'basyura/twibill.vim'
"NeoBundle 'basyura/bitly.vim'
"NeoBundle 'basyura/TweetVim'
"NeoBundle 'tpope/vim-haml'
"NeoBundle 'scrooloose/nerdtree'

" vim-scripts repos
NeoBundleLazy 'surround.vim'
NeoBundle 'L9'
"NeoBundle 'FuzzyFinder'
NeoBundle 'Quich-Filter'
NeoBundle 'QuickBuf'
NeoBundle 'Sass'
NeoBundle 'project.tar.gz'
"TODO
""NeoBundle 'AutoClose'

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
"

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
set listchars=eol:$,tab:>-,trail:_,extends:<
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

" jkでのカーソルを表示行単位で移動できるように変更
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" 入力モード時にctrl + Enterで改行
inoremap <C-CR> <ESC>o

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
    autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

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

	" jQuery Mobile snippets
	autocmd BufNewFile *.html inoremap data<TAB> <div data-=""></div><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

	" JavaScript dictionaries
	autocmd filetype javascript :set dictionary=$HOME/vimfiles/dict/javascript.dict,$HOME/vimfiles/dict/jQuery.dict

	" Sass interporation snippets
	"autocmd filetype scss inoremap ip<TAB> #{}<Left>

	" xml, html insert end tag
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>

	" insert "<br />"
	autocmd Filetype html inoremap <S-CR> <br /><CR>

	" Disable Indent for HTML file
	autocmd FileType html set indentexpr&
	autocmd FileType xhtml set indentexpr&

	" delete whitespace
	autocmd BufWritePre * :%s/\s\+$//e

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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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
  imap <silent>L <Plug>(neosnippet_jump_or_expand)
  smap <silent>L <Plug>(neosnippet_jump_or_expand)
  xmap <silent>L <Plug>(neosnippet_start_unite_snippet_target)
  imap <silent>K <Plug>(neosnippet_expand_or_jump)
  smap <silent>K <Plug>(neosnippet_expand_or_jump)
  imap <silent>G <Plug>(neosnippet_expand)
  imap <silent>S <Plug>(neosnippet_start_unite_snippet)
  xmap <silent>o <Plug>(neosnippet_register_oneshot_snippet)
  xmap <silent>U <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  let g:neosnippet#enable_snipmate_compatibility = 1

  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Snippets file dir
  "let g:neosnippet#snippets_directory = '~/.vim/snippets'
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
"let g:vimfiler_safe_mode_by_default = 0
" default filer config
let g:vimfiler_as_default_explorer = 1

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
augroup jslint
    autocmd! jslint
    autocmd FileType javascript call s:javascript_filetype_settings()
augroup END

function! s:javascript_filetype_settings()
  autocmd BufLeave     <buffer> call jslint#clear()
  autocmd BufWritePost <buffer> call jslint#check()
  autocmd CursorMoved  <buffer> call jslint#message()
endfunction

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
" zencoding.vim: {{{
"let g:user_zen_leader_key = '<C>'
"let g:user_zen_expandabbr_key = '<TAB>'
"let g:user_zen_expandword_key = '<C-h>'
"let g:user_zen_balancetaginward_key = '<C-y>,'
"let g:user_zen_balancetagoutward_key = '<C-y>,'
"let g:user_zen_next_key = '<C-y>,'
"let g:user_zen_prev_key = '<C-y>,'
"let g:user_zen_imagesize_key = '<C-y>,'
"let g:user_zen_togglecomment_key = '<C-y>,'
"let g:user_zen_splitjointag_key = '<C-y>,'
"let g:user_zen_removetag_key = '<A-->,'
"let g:user_zen_anchorizeurl_key = '<C-y>,'
"let g:user_zen_anchorizesummary_key = '<C-y>,'
let g:user_zen_settings = {
\	'lang': 'ja',
\	'html': {
\		'indentation': '',
\		'snippets': {
\			'flash': "<object data=\"${cursor}\""
\					." type=\"application/x-shockwave-flash\""
\					." id=\"\" width=\"\" height=\"\">\n"
\					."<param name=\"movie\" value=\"\" />\n</object>",
\			'script:jq': "<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js\" type=\"text/javascript\"></script>",
\		},
\	},
\	'css': {
\		'filters': 'fc'
\	},
\	'javascript': {
\		'snippets': {
\			'fn'       : "function(){\n\t${cursor}\n};",
\			'fn:name'  : "function ${cursor}(){\n\t${child}\n};",
\			'fn:scope' : "(function(){\n\t${cursor}\n})();",
\			'get:id'   : "document.getElementById(${cursor});",
\			'get:class': "document.getElementsByClassName(${cursor});",
\			'get:tag'  : "document.getElementsByTagName(${cursor});",
\			'create'   : "document.createElement(${cursor});",
\			'tm'       : "setTimeout(function(){\n\t${cursor}\n}, 100);",
\			'interval' : "setInterval(function(){\n\t${cursor}\n}, 100);",
\			'add:event': "object.addEventListener('${cursor}', function(){\n\t${child}\n}, false);",
\			'jq'       : "$(function(){\n\t${cursor}${child}\n});",
\			'jq:scope' : "(function($){\n\t$(function(){\n\t\t${cursor}${child}\n\t});\n})(jQuery);",
\			'jq:each'  : "$.each(${cursor}, function(index, item){\n\t${child}\n});",
\			'jq:ajax'  : "$.ajax({\n\ttype: 'GET',\n\turl: 'file path${cursor}',\n\tdataType: 'file type',\n\tsuccess: function(data){\n\t\t${child}\n\t}\n});",
\			'jq:plugin': "jQuery.fn.pluginName = function(){\n\t${cursor}\n};",
\			'jq:proxy' : "$.proxy(function(){\n\t${cursor}\n},obj);",
\			'jq:conf'  : "jQuery.noConflict();",
\			'Ti'       : "Titanium.",
\			'Ti:ui'    : "Ti.UI.",
\			'Ti:info'  : "Ti.API.info(${cursor});",
\			'Ti:debug' : "Ti.API.debug(${cursor});",
\			'Ti:error' : "Ti.API.error(${cursor});",
\			'Ti:log'   : "Ti.API.log(${cursor}level, msg);",
\			'Ti:warn'  : "Ti.API.warn(${cursor});",
\		},
\	},
\}

"}}}
