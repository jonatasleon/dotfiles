" Startify config
let g:startify_change_to_dir = 0

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'files',     'header': ['   Files']            },
  \ ]

" Bookmarks
let g:startify_bookmarks = [
  \ { 'p': '~/.dotfiles/zsh/profile.zsh' },
  \ { 'v': '~/.dotfiles/config/nvim/init.vim' },
  \ { 'z': '~/.dotfiles/zshrc' },
  \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
