"vimrc for along@


"basic setting
syntax on
set syn=c
set laststatus=2
set number
set tabstop=4	
set cindent
set autoindent
set shiftwidth=4
set updatetime=1000
filetype on
"show files dir
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "显示文件名：总行数，总的字符数
set ruler "在编辑过程中，在右下角显示光标位置的状态行

let g:mapleader=','


"本地映射  :map  unmpa
inoremap jj <ESC>
inoremap JJ <ESC>
map <leader>w <ESC>:w<CR>
imap <leader>w <ESC>:w<CR>
map <leader>q <ESC>:q!<CR>
map <leader>wq <ESC>:wq<CR>
imap <leader>wq <ESC>:wq<CR>
map <leader>qq <ESC>:qa!<CR>
map <leader>wqq <ESC>:wqa!<CR>
imap <leader>wqq <ESC>:wqa!<CR>


imap <leader>W <ESC>:w<CR>

"enter键跳转至第一个tag
nnoremap <cr> <C-]>
nnoremap <space><cr> <C-t>

"切换到当前上窗口
nmap  <C-k> <C-w>k
"切换到当前下窗口
nmap  <C-j> <C-w>j
"切换到当前左窗口
nmap  <C-h> <C-w>h
"切换到当前右窗口
nmap  <C-l> <C-w>l

"移动到行首字母
nmap <leader>hh ^
"移动到行尾字母
nmap <leader>ll $
"half page up
nmap <leader>jj <C-d>
"half page down
nmap <leader>kk <C-u>

"列出所有tag
nmap <leader>lt :tj 
"下一个tag
nmap <leader>nt :tn<CR>
"惯用 下一个tag
nmap <leader>tt :tn<CR>
"上一个tag
nmap <leader>pt :tp<CR>

"向下查找该字符
nmap <leader>v *
"向上查找该字符
nmap <leader>V #

"跳到本代码段开头
nmap <leader>S [{
"跳到本代码段结尾
nmap <leader>s ]}

" "buffer opraspaceon
" "列出所有buffer
" nmap <leader>lb :ls<CR>
" "打开上个buffer  
" nmap <leader>pb :bp<CR>
" nmap <leader>bb :bp<CR>
" "打开下个buffer
" nmap <leader>nb :bn<CR>


nmap <Space>v :vs<CR>
nmap <Space>h :sp<CR>

"打开文件自动跳转光标
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif




"vim插件管理 vim-plug
":PlugInstall
call plug#begin('~/.vim/plugged')

"install startify
Plug 'mhinz/vim-startify'

"install hybrid meterial colorscheme
Plug 'kristijanhusak/vim-hybrid-material'

"install NERDTree
Plug 'scrooloose/nerdtree'


"install tagbar
Plug 'majutsushi/tagbar'

"install vim-gutentag
Plug 'ludovicchabant/vim-gutentags'

"install easymotion
Plug 'easymotion/vim-easymotion'


"install fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"install far
Plug 'brooth/far.vim'

"install vim-interestingwrods
Plug 'lfv89/vim-interestingwords'

"install surround
Plug 'tpope/vim-surround'

"install rooter
Plug 'airblade/vim-rooter'

"install gutentags_plus
Plug 'skywind3000/gutentags_plus'

"install vim-preview
Plug 'skywind3000/vim-preview'

Plug 'jeetsukumaran/vim-buffergator'


call plug#end()


"一些插件的配置

"for hybrid meterial
set background=dark

colorschem hybrid_material
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif


"for NERDTree
"nmap <C-n> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1


"for clang_complete
" let g:clang_library_path='/usr/lib/llvm-6.0/lib/'
" let g:clang_close_preview=1
" let g:clang_auto_select=1
" let g:clang_complete_auto=1
" "这个插件的以下两个变量可能会导致vim内置插件无法跳转
" let g:clang_jumpto_declaration_key=""
" let g:clang_jumpto_declaration_in_preview_key=""

"for tagbar



nnoremap <silent> <leader>m :TagbarToggle<CR>
let g:tagbar_autofocus = 1

   
"for vim-gutentag
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.tagscache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']  
let g:gutentags_ctags_extra_args += ['--c-kinds=+x']  "c 全局变量 

"c -kinds 有以下几种 sh: ctags --list-kinds
"c  classes
"    d  macro definitions
"    e  enumerators (values inside an enumeration)
"    f  function definitions
"    g  enumeration names
"    l  local variables [off]
"    m  class, struct, and union members
"    n  namespaces
"    p  function prototypes [off]
"    s  structure names
"    t  typedefs
"    u  union names
"    v  variable definitions
"    x  external and forward variable declarations [off]


set statusline+=%{gutentags#statusline()}


let g:gutentags_modules = ['ctags','gtags_cscope']
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_define_advanced_commands = 1 "debug info

"for gutentags-plus
let g:gutentags_plus_switch = 1

"取消默认映射
let g:gutentags_plus_nomap = 1


"for easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"map <leader>l <Plug>(easymotion-lineforward)
"map <leader>j <Plug>(easymotion-j)
"map <leader>k <Plug>(easymotion-k)
"map <leader>h <Plug>(easymotion-linebackward)

nmap <leader><leader>l <Plug>(easymotion-lineforward)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>d <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)
nmap <leader><leader>u <Plug>(easymotion-k)
nmap <leader><leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:EasyMotion_smartcase = 1


"for fzf
nmap <C-p> :Files $PWD<CR>


"nmap vv :Rg<CR>
""使用Rg查询当前光标下的字符  help expand
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep( 
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)



"for rooter
let g:rooter_patterns = ['Rakefile', '.git/', '.root/', 'Makefile']
let g:rooter_silent_chdir = 1

"for preview
nnoremap <space> :PreviewQuickfix<cr>
nnoremap <space>p :PreviewClose<cr>

"for gscope
"查看引用
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"查看定义
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"查看定义
noremap <silent> <cr><cr> :GscopeFind g <C-R><C-W><cr>
"查看被调用
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"查看被调用
noremap <silent> vv :GscopeFind c <C-R><C-W><cr>
"查找文本
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"使用egrep查找
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"查看文件名
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"查看被包含
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"查看调用
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"查找赋值
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

"for buffergator
let g:buffergator_viewport_split_policy="B"

nnoremap <Space><Space> :BuffergatorToggle<cr>


"for echofunc
"使其函数原型显示在状态栏
"set statusline+=%{EchoFuncGetStatusLine()}
"let g:EchoFuncShowOnStatus = 1

let g:EchoFuncAutoStartBalloonDeclaration=1
let g:EchoFuncMaxBalloonDeclarations=2



"某些快捷键提示

"<leader>b  ----- 打开buffer列表
"<space><space>

"<leader>B  ----- 关闭buffer列表
"d          ----- 删除列表中条目

"for far
"Far aa bb ../*    
"Fardo

"for vim-surround
"ysiw "          ---------光标所在word添加“
"cs " '          ---------光标所在word的”->'
"ds "            ---------光标所在word的“被删除

"for vim-interestingwrods 
"<leader>k       ---------光标所在的word高亮
"<leader>K       ---------取消该高亮

"for gutentags
"<leader>cg - 查看光标下符号的定义
"gg

"<leader>cs - 查看光标下符号的引用

"<leader>cc - 查看有哪些函数调用了该函数
"vv

"<leader>cf - 查找光标下的文件
"<leader>ci - 查找哪些文件 include 了本文件


"for preview
"<space>  - 右侧打开该条quickfix
"<leader>p  - 关闭右侧quickfix
"





