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

# Check if exist TPM
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    echo "Downloading TPM"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Check for my custom snips
if [ ! -d $HOME/.vim/UltiSnips  ]; then
    echo "Downloading Jonatas' custom UltiSnips"
    git clone https://github.com/jonatasleon/my-snips ~/.vim/UltiSnips
fi

