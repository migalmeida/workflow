so ~/.vim/autoload/plug.vim
so ~/.vim/plugins
so ~/.vim/mappings

" Theme
colorscheme base16-railscasts
let base16colorspace=256  " Access colors present in 256 colorspace

" Plugins
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Deoplete
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

if has("gui")
    let g:deoplete#enable_at_startup = 0
    let g:deoplete#disable_auto_complete = 1
else
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#disable_auto_complete = 0
endif

" close the documentation window when competion is done
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" TernJS
let tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Use deoplete.
let g:tern_request_timeout = 1

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Tab settings
filetype plugin indent on 
set tabstop=4
set shiftwidth=4
set expandtab

" Clipboard settings
set clipboard=unnamed

" Show line numbers
set number
set relativenumber

set timeoutlen=1000 ttimeoutlen=0
