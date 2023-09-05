# Environment Setup for OSX

This is the untested development setup environment for OSX.

 1. Install xcode command line tools
   - `xcode-select install`
 2. Install homebrew:
   - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
 3. Install command line packages in the [packages file](os-packages) one by one
 4. Setup zsh
   - Install oh my zsh
     -`./zsh/install-oh-my-zsh.sh`
   - Copy the zsh extras over to the new zshrc
     -`cat ./zsh/.zshrc-extras >> ~/.zshrc`
   - Look over the zshrc
     - `vim ~/.zshrc`
 5. Setup vim
   - Copy the vimrc
     - `cp ./vim/.vimrc ~/.vimrc`
   - Install vim plug
     - `./vim/install-plug.sh"
   - Install vim plugins
     - `vim`
     - `:PlugInstall`
   - Add YouCompleteMe (optional)
 6. Setup tmux
   - copy tmux configuration
     - `cp ./tmux/.tmux.conf ~/.tmux.conf`
 7. Setup git
   - Copy gitconfig
     - `cp ./.gitconfig ~/.gitconfig`
 8. Setup ttyd
   - Setup launchd configuration for ttyd
     - `cp osx/LaunchAgents/ttyd.plist ~/Library/LaunchAgents/ttyd.plist`
     - `cp ./osx/LaunchAgents/ttyd.plist ~/Library/LaunchAgents/ttyd.plist`
     - `launchctl load ~/Library/LaunchAgents/ttyd.plist`
     - `launchctl start com.godzilla.ttyd`
 9. Install [Arc browser](https://arc.net/)
 10. Turn on the Mac firewall
   - Go to System Settings
   - Go to Network
   - Click the Firewall tab
   - Toggle the on-off button
