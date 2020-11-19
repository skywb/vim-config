set undodir=~/.vim/undo-dir
set undofile
set nocompatible
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set encoding=utf8
"设置backspace   允许自动缩进， 允许换行符和连接线上退格， "开始插入的时候允许回退"
set backspace=start,indent,eol
"代码补全
"filetype plugin indent on
set completeopt=menu,preview,noinsert
set pumheight=10
set scrolloff=4   "光标移动到buffer的底部和顶部时保持三行的距离
set history=1000   "设置命令历史上限
set fileencodings=utf-8,gbk,unicode
"set autochdir
"状态栏设置
"set laststatus=2
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
"显示命令
set showcmd
set nu
set rnu "设置相对行号

"执行查找前预览第一处匹配
set incsearch
set hlsearch
"设置normal模式下， BackSpace关闭高亮
nmap <BackSpace> :nohl<CR>

"设置命令行补全菜单
set wildmenu
"高亮当前行
set cursorline
"高亮当前列
set cursorcolumn

"windows 下自动缩进
set cindent
"按照C/C++风格自动缩进
syntax on

"启用鼠标支持
set mouse=a

"set tags=./.tags;,.tags

"set cscopetag
"set cscopeprg='gtags-cscope'

colorscheme molokai

"=================vim函数========================================
"func! Term()
"	exec "ter ++row=8"
"endfunc

command Term :ter ++rows=8




"====================VIM运行设置====================
nnoremap gp `[v`]

"====================Netrw设置====================
let g:netrw_liststyle = 3
let g:netrw_winsize=15
let g:netrw_list_hide=  netrw_gitignore#Hide().'.*\.ruby-version$'




"=====================编译运行======================================
"
" C, C++ 按F9 编译运行
map  <F9> : call CompileRunGcc()<CR>
map! <F9> <ESC>:call CompileRunGcc()<CR>

map <F7> : call Compile()<CR>
map! <F7> <ESC>:call Compile()<CR>

map <F8> : call Run()<CR>
map! <F8> <ESC>:call Run()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ -std=c++14 % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

func! Compile()
	exec "w"
	exec "make"
endfunc

func! Run()
	exec "! ./%<"
endfunc

command Debug call Debug()

func! Debug()
	exec "w"
	exec "packadd termdebug"
	exec "let g:termdebug_wide = 163"
	exec "!g++ -g % -o%<_debug"
	exec "Termdebug %<_debug"
endfunc


"设置vim中make命令
if filereadable("makefile")
	set makeprg=make    "默认使用make命令
else 
	set makeprg=g++\ -o%<\ %    "没有makefile文件就使用g++命令编译当前文件
endif

map <F3> : call CopyAllToWindows()<CR> 
map! <F3> <ESC> : call CopyAllToWindows()<CR> 
vmap <F3> : write !/mnt/c/Windows/System32/clip.exe <CR>

func! CopyAllToWindows()
	exec "w"
	exec "!cat % |/mnt/c/Windows/System32/clip.exe"
endfunc

"========================编译运行end=====================================







"------------Plug config--------------------
call plug#begin('~/.vim/bundle')

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
"Plug 'Valloric/YouCompleteMe' 
"Plug 'SirVer/ultisnips' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
"Plug 'honza/vim-snippets' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
Plug 'octol/vim-cpp-enhanced-highlight' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
"Plug 'Shougo/echodoc.vim'
"Plug 'majutsushi/tagbar'
"Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'tpope/vim-fugitive'
"Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()


"filetype plugin indent on

"============插件的配置文件====================================
source ~/.vim/vimrcs/ack.vim
"source ~/.vim/vimrcs/NerdTree.vim
source ~/.vim/vimrcs/coc.vim
"source ~/.vim/vimrcs/airline.vim
source ~/.vim/vimrcs/leaderf.vim
"source ~/.vim/vimrcs/asynctasks.vim
"source ~/.vim/vimrcs/asyncrun.vim

"source ~/.vim/vimrcs/YCM.vim
"source ~/.vim/vimrcs/ultisnips.vim
"source ~/.vim/vimrcs/gutentags.vim
"source ~/.vim/vimrcs/Tagbar.vim


"==============================================

set regexpengine=1

"加载当前工作目录下的vimrc文件
if filereadable("workspace.vim")
	source workspace.vim
endif

"按语意折叠
set foldmethod=syntax
"设置打开默认不折叠
set foldlevelstart=99
