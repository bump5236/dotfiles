"My setting

"Plugin設定
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'tyru/caw.vim.git'


call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く


"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 編集中ファイル名の表示
set title
" カーソル位置を表示
set ruler
" 行番号を表示
set number
" 現在の行を強調表示
"set cursorline
" 現在の行を強調表示(縦)
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 自動インデント
set autoindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" Windowの縦幅を指定
"set lines=50
" Whindowの横幅を指定
"set columns=90
" コードに色をつける
syntax on

" 文字、カーソル設定
set list
" 不可視文字を可視化(タブが「▸-」と表示される)
set listchars=tab:▸\ ,trail:_
"set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" カーソルの形状を変更
let &t_ti.="\e[5 q"


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" その他
" 履歴を100件保存
set history=100

"vimでペーストするときインデントさせない
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" Share OS clipboard
set clipboard=unnamed

" Disable auto formatting on long line(tw)
set textwidth=0

" Cursor position never top/end(so)
set scrolloff=5

" カラースキーマの適用
colorscheme molokai
set t_Co=256
highlight Normal ctermfg=grey ctermbg=256
highlight Visual ctermfg=240 ctermbg=whitejj

" mapping config
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)

set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

"vimの下部に表示されるステータスラインを装飾"
"フォルダアイコンの表示をON
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" For python
filetype on
autocmd FileType python setl autoindent textwidth=99
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

