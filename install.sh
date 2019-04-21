#!/bin/bash

packages_list=(
    acpi
    alttab
    asciinema
    curl
    dmenu
    ffmpeg
    git
    git-svn
    htop
    hunspell
    i3blocks
    i3status
    minidlna
    rcm
    scrot
    traceroute
    whois
    xclip
    zsh
)

i3_list=(
    autoconf
    automake
    libev-dev
    libjpeg-turbo8-dev 
    libpam0g-dev
    libpango1.0-dev
    libstartup-notification0-dev
    libxcb1-dev
    libxcb-composite0
    libxcb-composite0-dev
    libxcb-cursor-dev
    libxcb-icccm4-dev
    libxcb-image0-dev 
    libxcb-keysyms1-dev
    libxcb-randr0 
    libxcb-randr0-dev
    libxcb-shape0-dev
    libxcb-util0-dev
    libxcb-util-dev
    libxcb-xinerama0
    libxcb-xinerama0-dev
    libxcb-xinerama0-dev 
    libxcb-xkb-dev
    libxcb-xkb-dev 
    libxcb-xrm0
    libxcb-xrm-dev
    libxkbcommon-dev
    libxkbcommon-x11-dev
    libyajl-dev
    xcb
)

add_repositories() {
    sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-get update && sudo apt-get upgrade -y
}

install_packages() {
    sudo apt-get install -y ${packages_list[@]}
    sudo apt-get install -y ${i3_list[@]}
}

install_i3() {
    # clone the repository
    git clone https://www.github.com/airblader/i3 /tmp/i3gaps
    cd /tmp/i3gaps

    # compile & install
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/

    # Disabling sanitizers is important for release versions!
    # The prefix and sysconfdir are, obviously, dependent on the distribution.
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make
    sudo make install
}

install_betterlockscreen() {
    mkdir -p $HOME/.local/bin/
    wget -O $HOME/.local/bin/betterlockscreen https://git.io/fASUJ
    chmod u+x $HOME/.local/bin/betterlockscreen
}

install_i3lockcolor() {
    git clone https://github.com/PandorasFox/i3lock-color.git /tmp/i3lock-color
    cd /tmp/i3lock-color

    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/

    # Disabling sanitizers is important for release versions!
    # The prefix and sysconfdir are, obviously, dependent on the distribution.
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make
    sudo make install
}

retrieve_dotfiles() {
    git clone https://github.com/jonatasleon/dotfiles $HOME/.dotfiles
    rcup -v
}

post_config() {
    chsh -s $(which zsh)
    echo 'Logout and Login again'
}

add_repositories
install_packages
install_i3gaps
install_i3lockcolor
install_betterlockscreen
retrieve_dotfiles
post_config
