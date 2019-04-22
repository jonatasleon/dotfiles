#!/bin/bash

packages_list=(
    acpi
    alttab
    asciinema
    compton
    conky
    ctags
    curl
    dmenu
    dunst
    feh
    ffmpeg
    fonts-powerline
    git
    git-svn
    htop
    hunspell
    i3blocks
    i3status
    imagemagick
    lftp
    minidlna
    powerline
    rar
    rcm
    rofi
    screenfetch
    scrot
    tmux
    traceroute
    transmission-cli
    urlview
    vim
    whois
    xautolock
    xclip
    zsh
)

i3_list=(
    libxcb1-dev
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
    xutils-dev
    libxcb-shape0-dev
    autoconf
    libtool
)

add_repositories() {
    sudo add-apt-repository -y ppa:martin-frost/thoughtbot-rcm
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-get update && sudo apt-get upgrade -y
}

install_font() {
    cd /tmp
    curl -L -o icons.zip $1
    mkdir -p $HOME/.fonts
    unzip -l icons | grep -e ".*ttf$" | awk '{ print $4  }' | xargs unzip icons.zip -d $HOME/.fonts
    rm icons.zip
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

install_xcbutils() {
    cd /tmp/
    git clone --recursive https://github.com/Airblader/xcb-util-xrm
    cd xcb-util-xrm/
    ./autogen.sh
    make
    sudo make install

    echo '/usr/local/lib/' > /etc/ld.so.conf.d/i3.conf
    sudo ldconfig
    sudo ldconfig -p
}

retrieve_dotfiles() {
    git clone https://github.com/jonatasleon/dotfiles $HOME/.dotfiles
    rcup -v
}

post_config() {
    echo 'Run the command above. Logout and login to finish.'
    echo 'chsh -s $(which zsh)'
}

add_repositories
install_packages
install_xcbutils
install_i3
install_i3lockcolor
install_betterlockscreen
install_font https://github.com/FortAwesome/Font-Awesome/releases/download/5.8.1/fontawesome-free-5.8.1-desktop.zip
retrieve_dotfiles
post_config
