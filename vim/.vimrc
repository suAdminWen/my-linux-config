"   ---------  自定义的快捷键  ---------
" 定义快捷键的前缀
let mapleader=";"
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
nmap <Leader>1 :q!<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
nmap <Leader>x :x<CR>
nmap <Leader>h <C-w>w
nmap <Leader>m :nohl<CR>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"   -----------  基础设置  -----------

" 关闭vim对vi特性的兼容，vim新特性更适合我们，
" set nocompatible

" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI   
" 设置当文件被改动时自动载入
set autoread

" 开启文件类型检测，但Vundle插件要求关闭该选项
filetype off

" 高亮当前行和列
set cursorline
set cursorcolumn
" 颜色
colorscheme joit
" 开启语法高亮
if has("syntax")
	syntax on
    let python_highlight_all=1
endif

" 代开屏幕左侧的行号显示
set number

" 在屏幕右下角显示未完成的指令输入
set showcmd

" 上下移动光标时，光标的上方或下方至少保留显示的行数
set scrolloff=3

" indent, eol, start 代表的意思是 缩进位置， 行结束符， 段首，
" 这样设置可以使得backspace键在这三个特殊的位置也能进行回删动作
set backspace=indent,eol,start

" 显示匹配的括号
set showmatch

" 打开搜索高亮模式
set hlsearch

" smarttab要和后面的shiftwidth配合使用，它只作用于行首位置
" 当smarttab开启时，在行首键入<TAB>会填充shiftwidth设定的值，
" 在其他地方则填充tabstop设定的值
" set smarttab

" 打开自动缩进
set autoindent
set smartindent "智能缩进"
set cindent "C语言风格缩进"

" shiftwidth定义了每一次缩进对应的空格数，当你使用自动格式化(比如gq)，
" 或者手动缩进(<<和>>)时，vim使用的数值就是这个
set shiftwidth=4

" tabstop就是<TAB>字符所代表的空格数， 
" 一般我们会用expandtab把<TAB>转变为空格符，然后键入<TAB>时就会产生 
" tabstop个空格了 
set tabstop=4

" 将<TAB>符号转变为<SPACE>，也就是空格 set expandtab

" 总是把softtabstop设定成和tabstop一样的数值，这样无论是用<TAB>插入缩进
" 还是用<BS>删除缩进，其行为总是一样的
set softtabstop=4

" list开启对于制表符(tab)，行尾空格符(trail)，行结束符(eol)等等特殊符号
" 的回显
"set list listchars=eol:¬,tab:▸\ ,trail:.

" 代码折叠设置
" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za	" Enable folding with the <space>

" 禁止生成临时文件
set nobackup
set noswapfile

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key
" 
"	------	Vundle插件基本配置	------

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择，指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本，必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装
" 请将安装插件的命令放在vundle#begin和vundle#end之间

" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'lilydjwg/fcitx.vim'
" Github Plugin End


" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略

" vim-scripts Plugin End


" 有Git支持但不在github上的插件仓库
" Plugin 'git clone 后面的地址'

" Git Plugin End


" 本地的Git仓库(例如自己的插件)
" Plugin 'file:///+本地插件仓库绝对地址'

" Local Plugin End

" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()		" 必须

" 检测到文件类型后，开启缩进规则
filetype indent on		" 必须 加载vim自带和插件相应的语法和文件类型相关的脚本

" 忽略插件改变缩进，可以使用以下代替
" filetype plugin on

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

" 支持 PEP8 风格的缩进
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.yml
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

"	------	插件配置	------

" 自动补全 YouCompleteMe
" vim上的自动补全插件，注意该插件需要手动编译！！！
" 如果使用Vundle更新了YouCompleteMe，也需要重新编译！！！
let g:ycm_autoclose_preview_window_after_completion=1	" 完成操作之后自动补全窗口不消失
" 默认情况下输入`.`,`->`,`::`之后会触发补全函数和类，但是默认情况下是不补全全局函数的，
" 所以C语言中的printf之类的函数就无法补全。解决办法就是手动调用补全，对应的YCM函数是：
" ycm_key_invoke_completion，将其绑定到快捷键`ctrl+a`：
let g:ycm_key_invoke_completion = '<C-a>'	" 默认是<C-Space>，与切换输入法冲突
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif		" 离开插入模式后自动关闭预览窗口
let g:ycm_confirm_extra_conf = 0	" 关闭加载.ycm_extra_conf.py提示
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>	" 使用 \g 作为转到定义的快捷键
" Python with virtualenv support
" python3 << EOF
" import sys, vim, os

" ve_dir = vim.eval('$VIRTUAL_ENV')
" ve_dir in sys.path or sys.path.insert(0, ve_dir)
" activate_this = os.path.join(os.path.join(ve_dir, 'bin'), 'activate_this.py')

" EOF

" 语法检查插件 syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" taglist 插件
" 需要安装ctags
let Tlist_Use_Right_Window=1	"让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close=1	"当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其他文件的tag都被折叠起来
let Tlist_Exit_OnlyWindow=1	"如果taglist窗口是最后一个窗口，则退出Vim
let Tlist_WinWidth=32 "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/bin/ctags'	"这里比较重要，设置ctags的位置
" 默认打开Taglist
" let Tlist_Auto_Open=1

" airline 状态栏
" 需要安装补丁字体 powerline/fonts
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
"let g:airline_left_sep='>'

" 文件树 nerdtredd
" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI=1		" 不显示项目树上的额外信息，例如帮助，提示什么的
" 隐藏pyc文件
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" 显示隐藏文件
let NERDTreeShowHidden=1
" 删除文件时自动删除对应的buffer
let NERDTreeAutoDeleteBuffer=1

" 绑定F2到NERDTreeToggle
map <F2> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup=1
" 自动折叠插件 SimpylFold
let g:SimpyFold_docstring_preview=1		" 显示折叠代码的文档字符串

" Indent Guides 插件
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 自动保存
set autowrite
