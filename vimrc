set gcr=a:block-blinkon0   " 禁止光标闪烁

set guioptions-=l " 禁止显示滚动条
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m " 禁止显示菜单和工具条
set guioptions-=T

fun! ToggleFullscreen()    " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

map <silent> <F11> :call ToggleFullscreen()<CR>   " 全屏开/关快捷键

autocmd VimEnter * call ToggleFullscreen()   " 启动 vim 时自动全屏

set laststatus=2 " 总是显示状态栏
 
set ruler  " 显示光标当前位置

set number  " 开启行号显示

set cursorline    " 高亮显示当前行/列
"set cursorcolumn

set hlsearch   " 高亮显示搜索结果

set guifont=YaHei\ Consolas\ Hybrid\ 11.5  " 设置 gvim 显示字体

set nowrap  " 禁止折行

let g:Powerline_colorscheme='solarized256'   " 设置状态栏主题风格

syntax enable  " 开启语法高亮功能

syntax on   " 允许用指定语法高亮配色方案替换默认方案

syntax keyword cppSTLtype initializer_list

filetype indent on   " 自适应不同语言的智能缩进

set expandtab            " 将制表符扩展为空格

set tabstop=4          " 设置编辑时制表符占用空格数

set shiftwidth=4      " 设置格式化时制表符占用空格数

set softtabstop=4      " 让 vim 把连续数量的空格视为一个制表符

let g:indent_guides_enable_on_vim_startup=1   " 随 vim 自启动

let g:indent_guides_start_level=2    " 从第二层开始可视化显示缩进

let g:indent_guides_guide_size=1     " 色块宽度

:nmap <silent> <Leader>i <Plug>IndentGuidesToggle    " 快捷键 i 开/关缩进可视化

"set foldmethod=indent  " 基于缩进或语法进行代码折叠
set foldmethod=syntax

set nofoldenable  " 启动 vim 时关闭折叠代码



