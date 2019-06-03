# NVIM dotfiles

Configures nvim how I'd like it to be, for duplication, you'll have to install [vim-plug](https://github.com/junegunn/vim-plug) first.
Then run `nvim +PlugInstall +UpdateRemotePlugins +qa`

# Shortcuts (so far)

Leader = `,`

| Shortcut | Action | Mnemonic 
| ---------|:-------:|---------:|
| C-k | Switch window up | 
| C-j | Switch window down | 
| C-l | Switch window right | 
| C-h | Switch window left |
| <leader>b | :CtrlPBuffer | 
| <leader>d | :NERDTreeToggle |
| <leader>f | :NERDTreeFind | f(ind)0
| <leader>t | :CtrlP |
| <leader>T | CtrlP but after clearing cache
| <leader>j | TagbarToggle
| <leader>gs | fugitive -> GStatus | g(it) s(tatus)
| <leader>gd | fugitive -> GDiff | g(it) d(iff)
| <leader>gc | fugitive -> GCommit | g(it) c(ommit)
| <leader>gp | fugitive -> GPush | g(it) p(ush)
| <leader>gg | GitGutterToggle | g(it) g(utter)
| <leader>pu | PlugUpdate | p(lug) u(pdate)
| <leader>pi | PlugInstall | p(lug) i(nstall)
| <leader>V | Reload init.vim |
| <F5> | LanguageClient Context Menu |
| K | LanguageClient hover |
| gd | LanguageClient get definition | g(et) d(efinition)
| <F2> | LanguageClient rename |

