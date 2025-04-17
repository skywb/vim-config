set t_ut=
set undodir=~/.vim/undo-dir
set undofile
" set nocompatible
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
set pumheight=15
set scrolloff=3   "光标移动到buffer的底部和顶部时保留四行的距离
set history=1000   "设置命令历史上限
" set fileencodings=utf-8,gbk,unicode,utf-16le,default,ucs-bom,latin1,gb2312,cp936,gb18030
set fileencodings=utf-8,gbk,ucs-bom,utf-16le,default,latin1,gb2312,cp936,gbk,gb18030
"set autochdir
"状态栏设置
"set laststatus=2
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
"显示命令
set showcmd
set nu
set rnu "设置相对行号
set maxmempattern=200000
set redrawtime=20000

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

" 设置垂直分割窗口时，分割到下方
set splitbelow



" colorscheme molokai
colorscheme one
set background=dark

" 设置命令行补全模式
set wildmode=longest,list,full

" 设置文件浏览器宽度
let g:netrw_winsize = 20
let g:netrw_altv = 1
let g:netrw_liststyle = 3
set guifont=Menlo-Regular:h16

"=================vim函数========================================
command Term :ter ++rows=8


"====================VIM运行设置====================
nnoremap gp `[v`]

"=====================debug======================================

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
	set makeprg=bazel\ build\ ...
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

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'octol/vim-cpp-enhanced-highlight' ", { 'for' : ['c', 'cpp', 'vim', 'hpp', 'h'] }
"Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'alepez/vim-gtest'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'skywind3000/asynctasks.vim'
"Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'puremourning/vimspector'
Plug 'junegunn/vim-easy-align'

"Plug 'lakshayg/vim-bazel'


call plug#end()


"filetype plugin indent on

"============插件的配置文件====================================
source ~/.vim/vimrcs/ack.vim

if filereadable(expand("$HOME/.vim/bundle/coc.nvim/plugin/coc.vim"))
  source ~/.vim/vimrcs/coc.vim
endif

if filereadable(expand("$HOME/.vim/pack/gongfeng/start/vim/autoload/copilot.vim"))
  imap <C-l> <C-S-down>
endif

"source ~/.vim/vimrcs/airline.vim
source ~/.vim/vimrcs/leaderf.vim
"source ~/.vim/vimrcs/asynctasks.vim
"source ~/.vim/vimrcs/asyncrun.vim
"source ~/.vim/vimrcs/Tagbar.vim
source ~/.vim/vimrcs/easy_align.vim


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
" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return sub . info
endfunction


" 设置全彩色支持
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

function Copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call s:raw_echo(s)
endfunction

function! s:raw_echo(str)
  if has('win32') && has('nvim')
    call chansend(v:stderr, a:str)
  else
    if filewritable('/dev/fd/2')
      call writefile([a:str], '/dev/fd/2', 'b')
    else
      exec("silent! !echo " . shellescape(a:str))
      redraw!
    endif
  endif
endfunction

autocmd TextYankPost * call Copy()

set fillchars+=vert:│   " 改为竖线符号（Unicode U+2502）
highlight VertSplit ctermfg=DarkGray ctermbg=NONE guifg=#666666 guibg=NONE
" set fillchars+=horiz:─    " 水平分割线改为横线（Unicode U+2500）
" 分割线配色（适配终端和 GUI）
if has('gui_running')
  highlight VertSplit guifg=#555555 guibg=NONE gui=NONE
else
  highlight VertSplit ctermfg=242 ctermbg=NONE cterm=NONE
endif

" ~/.vimrc 配置
augroup DynamicLineNumber
  autocmd!
  " 进入窗口时显示行号
  autocmd WinEnter * setlocal rnu
  " 离开窗口时隐藏行号
  autocmd WinLeave * setlocal nornu
augroup END

" 活动窗口显示绝对行号，非活动窗口隐藏行号
augroup ActiveWindowLineNumber
  autocmd!
  autocmd WinEnter * setlocal number relativenumber!
  autocmd WinLeave * setlocal nonumber norelativenumber
augroup END


