# dotfiles

## Clone

Clone the repository over SSH, including all submodules:

```sh
git clone --recurse-submodules git@github.com:konnovk/dotfiles.git
```

## Installation

### Neovim

Neovim `0.12.x` is required. See the [submodule README](dotfiles-nvim/README.md) for the full list of dependencies.

Back up the existing configuration, if present:

```sh
mv ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d-%H%M%S)
```

From the repository root, create a symbolic link to the submodule:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/dotfiles-nvim" ~/.config/nvim
```

Start Neovim:

```sh
nvim
```

On the first launch, `vim.pack` will automatically install the plugins.

### Kitty

Kitty and the **Cascadia Mono NF Light** font are required.

Back up the existing configuration, if present:

```sh
mv ~/.config/kitty ~/.config/kitty.backup-$(date +%Y%m%d-%H%M%S)
```

From the repository root, create a symbolic link to the submodule:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/dotfiles-kitty" ~/.config/kitty
```
