move_and_setup_symlink () {
    sudo mv $1 /opt/$2
    sudo ln -s /opt/$2/$1 /usr/local/bin/$2
}


# ZSH
sudo apt install zsh
chsh -s $(which zsh)
# restart shell zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install fonts-powerline

# Reoot for default shell changes to register
reboot

sudo apt install vim

# Firefox Developer Edition
# xdg-open "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
# move_and_setup_symlink "firefox" "firefox-developer-edition"
sudo add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
sudo apt update
sudo apt install firefox

# NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install node

# Java
curl -s "https://get.sdkman.io" | bash
source ~/.bashrc
sdk install java 22-open

# Followin may not be needed if zsh installed first
# echo -e 'export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> ~/.zshrc

# Android Studio 
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
xdg-open "https://developer.android.com/studio/index.html"
# download command line tools (? or just the full thing. below is full thing)
sudo mv ~/Downloads/android-studio /opt/android-studio
sudo ln -s /opt/android-studio/bin/studio.sh /usr/local/bin/android-studio
/opt/android-studio/bin/studio.sh
source ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/zycuu/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
source ~/.zshrc


# Watchman (recommended for React Native by Facebook)
brew update
brew install watchman

# React Native / Expo
npm install -g eas-cli
