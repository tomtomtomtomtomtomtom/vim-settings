set nu
colorscheme molokai
syntax on
set t_Co=256
let g:NERDTreeShowBookmarks=1
let g:molokai_original = 1
let g:rehash256 = 1
let NERDTreeShowHidden=1
nmap <Leader>kb :NERDTreeToggle<CR>
set background=dark
set showmode
set title
set ruler
set showcmd
set showmatch
set scrolloff=5
set cursorline
set hlsearch "検索文字列をハイライトする
set incsearch "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault "置換の時 g オプションをデフォルトで有効にするet list
set listchars=tab:»-,trail:▸
set laststatus=2
set backspace=2
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set autoread            " update file automaticaly
set expandtab           " insert space character insted tab
inoremap <silent> jj <ESC>      " change from insert to command by typping jj"
set nosi                " disable smartindext
set tabstop=2 shiftwidth=2 softtabstop=2        "set indent space
set splitbelow
set splitright
if has('vim_starting')
  " 初回起動時のみruntimepathにneobundleのパスを指定する
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
nmap <Leader>/ <Plug>(caw:zeropos:toggle)
vmap <Leader>/ <Plug>(caw:zeropos:toggle)
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/nerdtree'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle "jistr/vim-nerdtree-tabs"
NeoBundle "Xuyuanp/nerdtree-git-plugin"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "vim-airline/vim-airline"
NeoBundle "bronson/vim-trailing-whitespace"
NeoBundle "Yggdroot/indentLine"
NeoBundle "thinca/vim-quickrun"
NeoBundle "tyru/caw.vim"
NeoBundle "tyru/open-browser.vim"
NeoBundle "rhysd/accelerated-jk"

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
  call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
  call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
  call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
  call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

  let g:NERDTreeDirArrows = 1
  let g:NERDTreeDirArrowExpandable  = '‣'
  let g:NERDTreeDirArrowCollapsible = '▼'
" Powerline系フォントを利用する
let g:airline_powerline_fonts = 1

" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1

" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
