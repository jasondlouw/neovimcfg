"---Plugins-(VimPlug)---------------------------------------------------

call plug#begin()
"---Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'junegunn/goyo.vim'
    Plug 'lervag/vimtex'
    Plug 'vifm/vifm.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vimwiki/vimwiki'
    Plug 'chrisbra/unicode.vim'
"---Markdown-Tools
    Plug 'dhruvasagar/vim-table-mode' "---Better-markdown-tables
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-pandoc/vim-rmarkdown'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
"---Syntax
    Plug 'tpope/vim-markdown'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'ap/vim-css-color'
    Plug '~/.config/nvim/plugged/TeX-Syntax/tex.vim'
    Plug 'gerw/vim-tex-syntax'
    Plug 'mboughaba/i3config.vim'
"---Colour-Schemes
    Plug 'morhetz/gruvbox'
    Plug 'tomasr/molokai'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'ajmwagar/vim-deus'
    Plug 'keith/parsec.vim'
    Plug 'arcticicestudio/nord-vim'
"---Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
call plug#end()

"---General-Settings----------------------------------------------------

    let mapleader =" "
    syntax on
    set noerrorbells
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    set nowrap
    set smartcase
    set noswapfile
    set nobackup
    set undodir=~/.config/nvim/undo/
    set undofile
    set incsearch
    set wrap linebreak nolist
    set mouse=a
    set encoding=UTF-8
    filetype plugin indent on
    set autoread
    set confirm
    set wildmenu
    set number
    set rnu
    set spelllang=en_gb
    set spell
    set autoread
    set noruler
    set autoindent
    set cmdheight=2
    set hls is
    set cursorline
    set cursorcolumn
    set hidden
    set signcolumn=yes
    set dictionary=/usr/share/dict/words
    set signcolumn=yes
    set splitbelow splitright
    set undofile
    set ignorecase
    set showmatch
    set clipboard=unnamed
    autocmd InsertEnter * norm zz
    autocmd BufWritePre * %s/\s\+$//e

"---Theme-Settings

    set termguicolors
    set t_8f=^[[38;2;%lu;%lu;%lum
    set t_8b=^[[48;2;%lu;%lu;%lum
    colorscheme gruvbox
    set background=dark
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    lua require'colorizer'.setup()
    let g:airline_theme='bubblegum'
    highlight CursorColumn guibg=#282828
    highlight Comment cterm=italic gui=italic


"---Goyo-Settings

    function! s:goyo_enter()
    	set noshowmode
    	set noshowcmd
    	set cursorline
    endfunction

    function! s:goyo_leave()
    	set showmode
    	set showcmd
    	set cursorline
    	colorscheme gruvbox
    	set background=dark
    	hi! Normal ctermbg=NONE guibg=NONE
    	hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

"---Signify

    let g:signify_sign_add               = '+'
    let g:signify_sign_delete            = '-'
    let g:signify_sign_delete_first_line = '‾'
    let g:signify_sign_change            = '~'

"---Key-Remap

    map <C-g> :Goyo<CR>
    map <F5> :w! \| !comp <c-r>%<CR><CR>
    nmap <C-n> :NERDTreeToggle<CR>
    xnoremap K :move '<-2<CR>gv-gv

    "---Remaps-Ctl+hjkl-to-swap-between-splits

    nnoremap <C-h> <C-W>h
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-l> <C-W>l

    nnoremap <silent> ch :noh<CR>
    nnoremap <silent> cc :source ~/.config/nvim/init.vim<CR>
    nnoremap <silent> ss :w<CR>
    nnoremap <silent> se :wq<CR>
    nnoremap <silent> sc :set nospell<CR>
    nnoremap <silent> cs :set spell<CR>

    inoremap {<CR>  {<CR>}<Esc>O

    "---Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.

    nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
    nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


"---COC Settings

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"---VimTex

    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

"---UltiSnips

    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsSnippetDirectories=["~/.config/ultisnips"]


"---Markdown-Preview-Plugin
    let g:mkdp_refresh_slow=1

