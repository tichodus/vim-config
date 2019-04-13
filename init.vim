call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'

" Material theme
Plug 'kaicataldo/material.vim'

Plug 'mxw/vim-jsx'

Plug 'leafgarland/typescript-vim'

Plug 'peitalin/vim-jsx-typescript'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'w0rp/ale'

Plug 'francoiscabrol/ranger.vim'

Plug 'rbgrouleff/bclose.vim'

" JS language server
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

Plug 'townk/vim-autoclose'

Plug 'alvan/vim-closetag'

Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-unimpaired'

call plug#end()

set number


if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable

"Gruvbox theme
"set background=dark 
"colorscheme gruvbox

"Material theme
set background=dark
colorscheme material 
let g:material_theme_style = 'default'

" Configurations
let g:ale_completion_enabled = 1

" let g:deoplete#enable_at_startup = 1

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\ 'javascript': ['/home/stefan/.yarn/bin/javascript-typescript-stdio'],
			\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
			\ 'python': ['/usr/local/bin/pyls'],
			\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>



" ALE config

" In ~/.vim/ftplugin/javascript.vim, or somewhere similar.

" Enable completion where available.
 " This setting must be set before ALE is loaded.
 let g:ale_completion_enabled = 1

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" In ~/.vim/vimrc, or somewhere similar.
 let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'javascript': ['eslint'],
 \}




let g:ale_set_balloons_legacy_echo = 1


let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
let g:fzf_command_prefix = 'Fz'

"unimpaired
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

nnoremap <C-p> :FzFiles <CR>
nnoremap <C-f> :FzRg <CR>
nnoremap <C-s> :w <CR>
" Brackets

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

iabbrev <// </<C-X><C-O>
imap <C-Space> <C-X><C-O>
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs


"Comments config

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"TYPESSCRIPT FILETYPES
autocmd BufNewFile,BufRead *.tsx,*.jsx, *.ts set filetype=typescript.tsx

