set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
"Plugin 'SirVer/ultisnips'
"Plugin 'shougo/deoplete.nvim'
"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'

" Completion
Plugin 'maralla/completor.vim'

" Go
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-toml'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'
Plugin 'ap/vim-css-color'

" Clojure
"Plugin 'tpope/vim-fireplace'

" Themes
Plugin 'haishanh/night-owl.vim'
Plugin 'drewtempelmeyer/palenight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","

syntax on
filetype plugin indent on

set termguicolors
set background=dark
colorscheme palenight

set term=xterm-256color
set guioptions-=T  "remove toolbar
set mouse=a
set number
set copyindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

set cursorline " Highlight current line

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
"let g:UltiSnipsExpandTrigger = "<nop>"
"let g:ulti_expand_or_jump_res = 0
"function ExpandSnippetOrCarriageReturn()
"    let snippet = UltiSnips#ExpandSnippetOrJump()
"    if g:ulti_expand_or_jump_res > 0
"        return snippet
"    else
"        return "\<CR>"
"    endif
"endfunction
"inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

set backupdir=~/.vim-backup
set backupdir=~/.vim-backup

set nobackup
set nowritebackup

let g:go_fmt_command = "goimports"

" Enable deoplete at startup
"let g:deoplete#enable_at_startup = 1

" highlight current open file in nerdtree
map <leader>f :NERDTreeFind<cr>

" ignore some useless files
set wildignore+=*/build/*,*.so,*.swp,*.class,*.o,*.jar,*/target/*

" ag search on projects
let g:ag_working_path_mode="r"

" toggle tasks
noremap <silent> <buffer> <Leader>x :call Toggle_task_status()<CR>

" Shortcuts for buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "palenight"

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

