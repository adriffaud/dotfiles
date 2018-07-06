set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'shougo/deoplete.nvim'

" Javascript
" Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'othree/html5.vim'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'

" Themes
Plugin 'ayu-theme/ayu-vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'arcticicestudio/nord-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

syntax on
filetype plugin indent on

set termguicolors
"let ayucolor="mirage"
colorscheme nord

" Oceanic config
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'

set term=xterm-256color
set guioptions-=T  "remove toolbar
set mouse=a
set number
set copyindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set showmatch                       " Show matching brackets/parenthesis
set incsearch                       " Find as you type search
set hlsearch                        " Highlight search terms
set scrolloff=3
set nospell
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"
" stop bell
"
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


"
" highlight tabs, trailing spaces
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" auto close damn auto complete preview window
"let g:ycm_autoclose_preview_window_after_completion = 1

" use tags with YCM
"let g:ycm_collect_identifiers_from_tags_files = 1

"
" key binding
"
nmap <c-e> :NERDTreeToggle<cr>


" trying to trigger ultisnippet with enter key
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

set backupdir=~/.vim-backup
set backupdir=~/.vim-backup

set nobackup
set nowritebackup

let g:go_fmt_command = "goimports"

" no limit on the number of file indexed by ctrl+p
let g:ctrlp_max_files=0


" highlight current open file in nerdtree
map <leader>f :NERDTreeFind<cr>

" eclim java search
nmap <leader><F3> :JavaSearchContext<cr>

" CtrlP search only by filename and not full path
let g:ctrlp_by_filename = 1
map <leader>b :CtrlPBuffer<CR>

" ignore some useless files
set wildignore+=*/build/*,*.so,*.swp,*.class,*.o,*.jar,*/target/*

" ag search on projects
let g:ag_working_path_mode="r"

" toggle tasks
noremap <silent> <buffer> <Leader>x :call Toggle_task_status()<CR>

" visual preview
"set inccommand=nosplit

" Do not limit JSX to .jsx
let g:jsx_ext_required = 0
" Do not use a different color for closing tags
highlight link xmlEndTag xmlTag

" Lint on save only
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Auto prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
