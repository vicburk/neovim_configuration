# Neovim Configuration

My Neovim configuration uses LazyVim with personalized keybindings and addons. The newest version of Neovim is required for the setup.

# Installation

Manually download the newest version of Neovim using the following code.
``` {bash}
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```
Add the path for Neovim.
```{bash}
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```
Clone this repository to the .config file.
```{bash}
git clone https://github.com/vicburk/neovim_configuration.git
```
Now you should be able to start Neovim, and everything should load automatically.
```{bash}
nvim
```
