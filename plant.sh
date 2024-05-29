# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install homebrew packages
brew install fortune \
  tmux \
  reattach-to-user-namespace \
  tmuxp \
  zsh \
  git \
  vim \
  fortune \
  font-fira-code-nerd-font \
  arc \
  # ttyd\

# Setup zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ./zsh/.aliases ~/.aliases
cat ./zsh/.zshrc-extras >> ~/.zshrc

# Setup git configuration
cp ./git/.gitignore ~/.gitignore
cp ./git/.gitconfig ~/.gitconfig

# Setup tmux configuration
cp ./tmux/.tmux.conf ~/.tmux.conf

# Setup neovim configuration
cp -r ./config/nvim ~/.config

# Install ttyd (paused until font issue is resolved)
# brew install ttyd
# cp ./osx/LaunchAgents/ttyd.plist ~/Library/LaunchAgents/ttyd.plist
# launchctl load ~/Library/LaunchAgents/ttyd.plist
# launchctl start com.godzilla.ttyd
