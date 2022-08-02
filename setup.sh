echo "Installing xcode-stuff"
# TODO: how to check
# xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  # Update homebrew recipes
  echo "Updating homebrew..."
  brew update
#  echo "[Skip this step, because already installed homebrew]"
fi

#Install Zsh & Oh My Zsh
if ! [ -n "$ZSH_VERSION" ]; then
    echo "Installing Oh My ZSH..."
    curl -L http://install.ohmyz.sh | sh

    echo "Setting up Zsh plugins..."
    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions

    echo "Setting ZSH as shell..."
    chsh -s /bin/zsh
else
  echo "[Skip this step, because already installed ZSH]"
fi

#Install homebrew
echo "Cleaning up brew"
brew cleanup
