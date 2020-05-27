"██████████████████████████████████████████████████████████████████████████████████████
"█                                                                                    █
"█                   ███    ██ ███████  ██████  ██    ██ ██ ███    ███                █
"█                   ████   ██ ██      ██    ██ ██    ██ ██ ████  ████                █
"█                   ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██                █
"█                   ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██                █
"█                   ██   ████ ███████  ██████    ████   ██ ██      ██                █
"█                                                                                    █
"██████████████████████████████████████████████████████████████████████████████████████

call plug#begin()
set runtimepath+=$GOROOT/misc/vim

""Fuzzy find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" UI enhancements
Plug 'yggdroot/indentline'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Terminal
Plug 'kassio/neoterm'

" Customized vim and tmux status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Theme
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'

" Syntax
Plug 'rhysd/vim-clang-format'
Plug 'leafgarland/typescript-vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'itspriddle/vim-marked'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Snippets
Plug 'mlaursen/vim-react-snippets'

call plug#end()

syntax on
set clipboard+=unnamed
set clipboard+=unnamedplus
let mapleader=","
set number
set relativenumber
set backspace=2
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set statusline=2
set ignorecase
set showmatch
set hidden
set nowrap
set updatetime=300
set splitbelow
set splitright

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Toggle spell check
nmap <leader>sc :set spell!<CR>


" Filetype indent and format settings
" ================================================================================================
augroup INDENT
    au!
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType javascriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd FileType go setlocal noexpandtab
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" Omnifunc for certain filetypes
autocmd FileType cmake setlocal omnifunc=syntaxcomplete#Complete


" NERDTree
" ================================================================================================
nnoremap <Leader>n :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
augroup NERD
    autocmd!
    " Open nerdtree and switch cursor to main window
    " autocmd VimEnter * NERDTree | wincmd p
    " No Signcolumn on nerdtree
    autocmd FileType tagbar,nerdtree setlocal signcolumn=no
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$', '\.pyc$', '^__pycache__$', '^\.git$']
" let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1

" Theme
" ================================================================================================:
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
syntax on
set background=dark

" Solarized Theme
let g:airline_solarized_bg='dark'
let g:solarized_visibility='high'
let g:solarized_diffmode='high'
let g:solarized_termtrans=1
let g:solarized_extra_hi_groups=1
colorscheme solarized8_high

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" Do not reset the tmuxline theme
"  Run :Tmuxline airline_visual full to set the theme
"  Run :TmuxlineSnapshot ~/.tmux.theme to create a theme file for .tmux.conf
let g:airline#extensions#tmuxline#enabled = 0
let g:indentLine_char = '⎸'

" Coc
" ================================================================================================
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-emmet',
            \ 'coc-json',
            \ 'coc-css',
            \ 'coc-pairs',
            \ 'coc-yaml',
            \ 'coc-html',
            \ 'coc-rust-analyzer',
            \ 'coc-python',
            \ 'coc-omni',
            \ 'coc-go',
            \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Show signcolumn for all files
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
" don't give |ins-completion-menu| messages.
set shortmess+=c

inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" FZF
" ================================================================================================
if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window
    " rather than going into the terminal's normal mode.
    autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
endif

nnoremap <silent> <space>f :Files<CR>
nnoremap <silent> <space>b :Buffers<CR>
nnoremap <silent> <space>c :Colors<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Turn of highlight search
nnoremap <silent> <CR> :noh<CR><CR>

" White Space Management"
" ================================================================================================
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

let g:vim_jsx_pretty_colorful_config = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" Auto Format Clang Files
autocmd FileType c ClangFormatAutoEnable
autocmd FileType c,cc,cpp,objc,h,hh,hpp  ClangFormatAutoEnable
let g:clang_format#style_options = {
    \ "BasedOnStyle": "Google",
    \ "AllowShortFunctionsOnASingleLine": "Inline" }

" Terminal Mode
" ================================================================================================
" easily escape terminal
tnoremap <Esc> <C-\><C-n><cr>
tnoremap <leader><esc> <C-\><C-n><esc><cr>

" quickly toggle term
nnoremap <silent> <leader><space> :Ttoggle<cr>i
tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>

" Wrap
:set showbreak=…
command! -nargs=* Wrap set wrap! linebreak nolist
nnoremap <leader>w :Wrap<cr>
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Go
" ================================================================================================
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_auto_type_info = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:polyglot_disabled = ['go']

nmap <silent> <Esc><Esc> :cclose<CR>
nmap <silent> <Esc><Esc> :lclose<CR>
let g:ale_linters = {
    \   'go': ['gopls','golint','govet','errcheck']
    \}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Help Tags Generate
" ================================================================================================
" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
