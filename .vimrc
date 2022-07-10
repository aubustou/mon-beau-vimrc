if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Python version
let g:python3_host_prog = '/usr/local/bin/python3.9'

let g:ale_disable_lsp = 1

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'psf/black', { 'branch': 'stable'  }
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-nomadproject'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-consul'
Plug 'wakatime/vim-wakatime'

" Initialize plugin system
call plug#end()

" Color scheme
syntax on
colorscheme onedark
let g:lightline = {'colorscheme': 'onedark',}

" Numbered lines
set nu

" ALE
let g:ale_python_pylint_options = '--rcfile ~/.config/pylint/pylint_py3.conf'
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = []
let b:ale_warn_about_trailing_whitespace = 1
let g:ale_python_flake8_options = '--max-line-length=88'

" Black support
let g:black_linelength = 88
let g:black_skip_string_normalization = 1

" Python PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set expandtab
" au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" file browsing
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" system clipboard
set clipboard=unnamed

" Leader
let mapleader = "-"

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1
au BufNewFile,BufRead Jenkinsfile setf groovy

" Coc
let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-git', 'coc-yaml', 'coc-sql', 'coc-sh']
nmap <silent> gr <Plug>(coc-references)

" Enable folding with the spacebar
nnoremap <space> za

" NerdTreeToggle
map <F2> :NERDTreeToggle<CR>

let $NVIM_COC_LOG_LEVEL='debug'

" Putain de retour chariot de merde
set wrap
set linebreak
set nolist  " list disables linebreak"
