set t_ut=
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
set completeopt=menu,popup,noselect
set pumheight=10
set scrolloff=4   "光标移动到buffer的底部和顶部时保留四行的距离
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
"set mouse=a

" 设置垂直分割窗口时，分割到下方
set splitbelow

" colorscheme molokai
colorscheme one
set background=dark

"=================vim函数========================================
command Term :ter ++rows=8




"====================VIM运行设置====================
nnoremap gp `[v`]

"=====================debug======================================
"
func! Debug(bin_path)
	exec "packadd termdebug"
	exec "let g:termdebug_wide = 163"
	exec "Termdebug "a:bin_path
endfunc

command -nargs=1 -complete=file Debug call Debug(<f-args>)


"设置vim中make命令
if filereadable("makefile")
	set makeprg=make    "默认使用make命令
elseif filereadable("WORKSPACE")
	set makeprg=bazel\ build
endif

" wsl中使用，可以将vim中内容复制到windows的剪贴板
"map <F3> : call CopyAllToWindows()<CR> 
"map! <F3> <ESC> : call CopyAllToWindows()<CR> 
"vmap <F3> : write !/mnt/c/Windows/System32/clip.exe <CR>
"
"func! CopyAllToWindows()
"	exec "w"
"	exec "!cat % |/mnt/c/Windows/System32/clip.exe"
"endfunc

"========================编译运行end=====================================






"------------Plug config--------------------
call plug#begin('~/.vim/bundle')

Plug 'neoclide/coc.nvim', {'branch': 'v0.0.81'}
Plug 'octol/vim-cpp-enhanced-highlight' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
"Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()


"filetype plugin indent on

"============插件的配置文件====================================
source ~/.vim/vimrcs/ack.vim

if filereadable(expand("$HOME/.vim/bundle/coc.nvim/plugin/coc.vim"))
  source ~/.vim/vimrcs/coc.vim
endif

"source ~/.vim/vimrcs/airline.vim
source ~/.vim/vimrcs/leaderf.vim
"source ~/.vim/vimrcs/asynctasks.vim
"source ~/.vim/vimrcs/asyncrun.vim
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

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
