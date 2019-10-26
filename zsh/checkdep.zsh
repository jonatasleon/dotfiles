# Check if exist antigen
if [ ! -f $HOME/.antigen/antigen.zsh ]; then
    echo "Downloading Antigen"
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
fi

# Check if exist vim.plug file
if [ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Downloading vim.plug"
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

# Check for my custom snips
if [ ! -d $HOME/.fzf ]; then
    echo "Downloading and installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    $HOME/.fzf/install --all --no-update-rc
fi
