#! /bin/sh

# Colors
cyan='\033[0;36m'
light_blue='\033[1;34m'

alias Reset="tput sgr0"      #  Reset text attributes to normal

# Color-echo.
# Argument $1 = messageu
# Argument $2 = Colortt
cecho() {
    echo "${2}${1}"
    Reset # Reset to normal.
    return
}

# Ask for the sudo password upfront
sudo -v

# Create projects
mkdir -p ~/Projects

echo ""
cecho "=================================================" $cyan
cecho " Install homebrew? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew tap homebrew/dupes
    brew tap homebrew/versions
    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Install brew utilities? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing brew packages" $light_blue

    binaries=(
      ansible
      hh
      hugo
      git
      brew-cask
      moreutils
      coreutils
      htop-osx
      httpie
      wget
      vim
    )
    brew install ${binaries[@]}
    brew cleanup

    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Install brew cask and apps? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing cask" $light_blue
    brew install caskroom/cask/brew-cask

    cecho "Tapping dupes and versions repos" $light_blue
    brew tap caskroom/dupes
    brew tap caskroom/versions
    brew tap homebrew/php

    echo ""
    cecho "Installing brew-cask apps" $light_blue
    apps=(
      1password
      dropbox
      firefox
      google-chrome
      google-drive
      imageoptim
      iterm2
      mailbox
      mou
      node
      nvalt
      qlimagesize
      qlmarkdown
      qlprettypatch
      qlstephen
      quicklook-csv
      quicklook-json
      sequel-pro
      sourcetree
      spectacle
      sublime-text3
      toggldesktop
      ubersicht
      vagrant
      virtualbox
      vlc
      webpquicklook
    )
    brew cask install ${apps[@]}
    brew cask cleanup

    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Install PHP using homebrew? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    echo ""
    cecho "Tapping PHP repo" $light_blue
    brew tap homebrew/php

    echo ""
    cecho "Installing PHP" $light_blue
    apps=(
      php56 --without-mysql --without-apache
      php56-mcrypt
      php-code-sniffer
      composer
    )
    brew install ${apps[@]}

    composer self-update

    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Install Mac App Store (MAS) CLI and apps? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing MAS" $light_blue
    brew install argon/mas/mas

    echo ""
    cecho "Installing Mac App Store apps" $light_blue
    mas install 405843582  # Alfred
    mas install 490461369  # Bandwidth+
    mas install 411246225  # Caffeine
    mas install 981117463  # Chatty
    mas install 504544917  # Clear
    mas install 926707738  # Countdowns
    mas install 961850017  # Gifs
    mas install 449830122  # HyperDock
    mas install 939343785  # Icon Set Creator
    mas install 409183694  # Keynote
    mas install 451444120  # Memory Clean
    mas install 915542151  # Monity
    mas install 409203825  # Numbers
    mas install 409201541  # Pages
    mas install 928494006  # PopHub
    mas install 507257563  # Sip
    mas install 803453959  # Slack
    mas install 747648890  # Telegram
    mas install 1017047129 # Timeless
    mas install 870659406  # Stache
    mas install 425424353  # The Unarchiver
    mas install 409789998  # Twitter

    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Install fonts? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    echo ""
    cecho "Installing brew-cask fonts" $light_blue

    brew tap caskroom/fonts
    fonts=(
      font-comic-neue
      font-droid-sans
      font-droid-sans-mono
      font-exo
      font-hack
      font-open-sans
      font-open-sans-condensed
      font-roboto
      font-source-code-pro
      font-terminus
    )
    brew cask install ${fonts[@]}
    brew cask cleanup

    break;;
  *) break;;
esac

echo ""
cecho "=================================================" $cyan
cecho " Download apps for manual installation? (y/n)" $cyan
cecho "=================================================" $cyan
read -r response
case $response in
  [yY])
    wget http://download.transmissionbt.com/files/Transmission-2.84.dmg -P ~/Downloads

    # curl -s http://php-osx.liip.ch/install.sh | bash -s 5.6
    # curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

    sudo vagrant plugin install vagrant-hostsupdater
    break;;
  *) break;;
esac
