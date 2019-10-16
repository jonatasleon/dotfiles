#!/bin/bash

packages_list=$(echo ./packages)
i3_list=$(echo ./i3packages)

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
    sudo apt-get install -y $(echo $packages_list)
    sudo apt-get install -y $(echo $i3_list)
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

install_polybar() {
    cd /tmp/
    git clone --recursive https://github.com/jaagr/polybar.git
    cd polybar
    yes | ./build.sh
}

retrieve_dotfiles() {
    git clone https://github.com/jonatasleon/dotfiles $HOME/.dotfiles
    rcup -v
}

post_config() {
    echo 'Run the command above. Logout and login to finish.'
    echo 'chsh -s $(which zsh)'
}

script_name=$(basename $0)

sub_help(){
    echo "Usage: $script_name <subcommand> [options]"
    echo "Subcommands:"
    echo "    install-npm-packages  Install needed npm packages"
    echo ""
    echo "For help with each subcommand run:"
    echo "$script_name <subcommand> -h|--help"
    echo ""

}

sub_full-install() {
    add_repositories
    install_packages
    install_xcbutils
    install_i3
    install_i3lockcolor
    install_betterlockscreen

    # Install FontAwesome icons
    install_font 'https://github.com/FortAwesome/Font-Awesome/releases/download/5.8.1/fontawesome-free-5.8.1-desktop.zip'

    # Install HelveticaNeue
    install_font 'https://freefontsdownload.net/download/74318/helveticaneue.zip'
    retrieve_dotfiles
    post_config
}

sub_install-deb-packages() {
    add_repositories
    install_packages
}

sub_install-npm-packages() {
    npm_packages=(
        eslint
        prettier
        csslint
        jsonlint
    )
    param=$1
    case $param in
        "-h" | "--help")
            echo "install npm packages"
            ;;
        "")
            npm install -g ${npm_packages[@]}
            ;;
    esac
}

subcommand=$1
case $subcommand in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${subcommand} $@
        if [ $? = 127  ]; then
            echo "Error: '$subcommand' is not a known subcommand." >&2
            echo "       Run '$script_name --help' for a list of known subcommands." >&2
            exit 1
        fi
        ;;
esac
