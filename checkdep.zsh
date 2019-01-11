# Check if exist antigen
if [ ! -f $HOME/.antigen/antigen.zsh ]; then
    echo "Downloading Antigen"
    mkdir -p $HOME/.antigen
    curl -L git.io/antigen > $HOME/.antigen/antigen.zsh
fi

# Check if exist vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    echo "Downloading Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
