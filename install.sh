#!/bin/bash

i3DIR=$HOME/.config/i3-gaps

add_repositories() {
    sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm
}

install_softwares() {
    sudo apt-get install -y <<EOLIST
        acpi
        alttab
        asciinema
        dmenu
        ffmpeg
        git
        git-svn
        htop
        hunspell
        i3
        i3blocks
        i3lock
        i3status
        minidlna
        rcm
        scrot
        traceroute
        whois
        xclip
EOLIST
}


install_i3() {
    sudo apt-get install -y <<EOLIST
        xcb
        libxcb1-dev
        libxcb-shape0-dev
        libxcb-keysyms1-dev
        libpango1.0-dev
        libxcb-util0-dev
        libxcb-icccm4-dev
        libyajl-dev
        libstartup-notification0-dev
        libxcb-randr0-dev
        libev-dev
        libxcb-cursor-dev
        libxcb-xinerama0-dev
        libxcb-xkb-dev
        libxkbcommon-dev
        libxkbcommon-x11-dev
        autoconf
        libxcb-xrm0
        libxcb-xrm-dev
        automake
EOLIST

    # clone the repository
    git clone https://www.github.com/Airblader/i3 $i3DIR
    cd $i3DIR

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

retrieve_dotfiles() {
    git clone https://github.com/jonatasleon/dotfiles $HOME/.dotfiles
    rcup -v
}


add_repositories
install_softwares
install_i3
retrieve_dotfiles
