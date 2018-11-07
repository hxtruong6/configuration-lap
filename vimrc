"================== Vundle ===================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
Plugin 'ryanoasis/vim-devicons'   "Always put it is the last one
call vundle#end()   " required
"============= End config vundle ==============

"============= Setting in vim =================
syntax on           " Turn on syntax highlighting
set autoread        " Reload file changed outside vim
set number          " Show number of line
set showcmd         " Show incomplete cmds down the bottom
set history=200     " Store :cmdline history
set mouse=a         " Enable using mouse
set hidden          " This makes vim act like all other editors, buffers can exist in the background without being in a window.
set noshowmode      " No show what current defaut mode

" ================ Indentation =====================
set autoindent
set smartindent
set smarttab
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set tabstop=4       " The width of a TAB is set to 4.
set expandtab

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb 

"================= Map ============================

"================= High light current line =========
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

"================ NERD Tree config =================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeQuitOnOpen = 1
"let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
map <C-o> :NERDTreeToggle<CR> " toggle Nerd tree

"=============== AUTO COMPLETE =============
filetype plugin on
set omnifunc=syntaxcomplete#Complete
let g:ycm_min_num_of_chars_for_completion = 4       " Start autocompletion after 4 chars
"let g:ycm_min_num_identifier_candidate_chars = 4
"let g:ycm_enable_diagnostic_highlighting = 0
"set completeopt-=preview                           " Don't show YCM's preview window [ I find it really annoying ] 
"let g:ycm_add_preview_to_completeopt = 0

"=============== Config gruvbox theme =======
colorscheme gruvbox
set background=dark    " Setting dark mode

"=============== Config pangloss/vim-javascript ============
"let g:javascript_plugin_jsdoc = 1

"=============== Scrooloose/nerdcommenter ============
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'  " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not
