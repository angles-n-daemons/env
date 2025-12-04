# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install homebrew packages
brew install fortune \
  tmux \
  reattach-to-user-namespace \
  tmuxp \
  zsh \
  git \
  iterm2 \
  arc \
  neovim \
  font-fira-code-nerd-font \
  ripgrep \
  ttyd\

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

# Install ttyd (ignored until font issue is resolved)
cp ./osx/LaunchAgents/ttyd.plist ~/Library/LaunchAgents/ttyd.plist
launchctl load ~/Library/LaunchAgents/ttyd.plist
launchctl start com.godzilla.ttyd
