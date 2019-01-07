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
Plugin 'inkarkat/vim-mark'
Plugin 'matze/vim-move'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-syntastic/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
Plugin 'chrisbra/NrrwRgn'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
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
set mousemodel=extend   " Using the mouse to search
set ignorecase
set smartcase       "When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not. For example, /The would find only "The", while /the would find "the" or "The" etc."
"set foldmethod=syntax
set foldmethod=indent
set nofoldenable    " disable folding
set hlsearch

" ================ Indentation =====================
set autoindent
set smartindent
set smarttab
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set tabstop=2       " The width of a TAB is set to 4.
set expandtab

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb 

" ================ Working with Unicode ===========
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 3       " Start autocompletion after 4 chars
"let g:ycm_min_num_identifier_candidate_chars = 4
"let g:ycm_enable_diagnostic_highlighting = 0
"set completeopt-=preview                           " Don't show YCM's preview window [ I find it really annoying ] 
"let g:ycm_add_preview_to_completeopt = 0
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0


"=============== Config gruvbox theme =======
" colorscheme gruvbox
" set background=dark    " Setting dark mode
" set termguicolors
" hi! link xmlTagN GruvboxBlue

"=============== Config papercolor theme ==========
set t_Co=256   " This is may or may not needed.
set background=dark
set termguicolors
set laststatus=2
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 0 
  \     }
  \   },
  \  'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
colorscheme PaperColor

"=============== Config pangloss/vim-javascript ============
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"=============== Scrooloose/nerdcommenter ============
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'  " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not

"============== Prettier ===============
let g:prettier#autoformat = 0
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'true'
let g:prettier#exec_cmd_path = "~/path/to/cli/prettier"

"============== Airline theme config ==================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
" let g:airline_theme='papercolor'
let g:airline_theme='dark'
" let g:airline_theme='deus'

"============== Vim cpp enhance highlight ==============
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"============== Vim -syntastic ============
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2 
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>      

"============= auto_highlight_current_word_when_idle ===========
" highlight all instances of word under cursor, when idle.
" type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
" function! AutoHighlightToggle()
  " let @/ = ''
  " if exists('#auto_highlight')
    " au! auto_highlight
    " augroup! auto_highlight
    " setl updatetime=4000
    " echo 'Highlight current word: off'
    " return 0
  " else
    " augroup auto_highlight
      " au!
      " au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    " augroup end
    " setl updatetime=500
    " echo 'Highlight current word: ON'
    " return 1
  " endif
" endfunction
"================== Highlight current word by enter =============
" let g:highlighting = 0
" function! Highlighting()
  " if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    " let g:highlighting = 0
    " return ":silent nohlsearch\<CR>"
  " endif
  " let @/ = '\<'.expand('<cword>').'\>'
  " let g:highlighting = 1
  " return ":silent set hlsearch\<CR>"
" endfunction
" nnoremap <silent> <expr> <CR> Highlighting()

" "================ highlight search word =============
" " press f4 to toggle highlighting on/off, and show current value.
" noremap <f4> :set hlsearch! hlsearch?<cr>

"================== Vim -mark =================
let g:mwDefaultHighlightingPalette = 'maximum'
highlight link SearchSpecialSearchType MoreMsg

"================== Copy to clipboard ===========
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

"================= Moving a line ===========
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
