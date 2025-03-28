# dotfiles
Personal configuration dot files

Install stow with:

`brew install stow`

Use stow to setup all the necessary symbolic links to the dotfiles here:

`> stow -v --dotfiles -t ~ .`

To see what actions stow would perform without actually doing them:

`> stow -nv --dotfiles -t ~ .`
