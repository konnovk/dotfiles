# dotfiles

## Requirements

### Neovim

- Neovim `0.12.x`.
- Git for installing plugins with `vim.pack`.
- `fzf` for fuzzy search.
- `ripgrep` for searching file contents.
- A Nerd Font for file icons.
- Tools required to build and install Tree-sitter parsers.
- Language servers installed separately and available in `PATH`:
  - `gopls`;
  - `rust-analyzer`;
  - `lua-language-server`.
- Clippy for checking Rust code (`rustup component add clippy`).
- `rustfmt` for formatting Rust code (`rustup component add rustfmt`).

### Kitty

- Kitty.
- **Cascadia Mono NF Light** font.

### tmux

- tmux.

## Clone

Clone the repository over SSH, including all submodules:

```sh
git clone --recurse-submodules git@github.com:konnovk/dotfiles.git
```

## Installation

### Neovim

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

Back up the existing configuration, if present:

```sh
mv ~/.config/kitty ~/.config/kitty.backup-$(date +%Y%m%d-%H%M%S)
```

From the repository root, create a symbolic link to the submodule:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/dotfiles-kitty" ~/.config/kitty
```

### tmux

Back up the existing configuration, if present:

```sh
mv ~/.config/tmux ~/.config/tmux.backup-$(date +%Y%m%d-%H%M%S)
```

From the repository root, create a symbolic link to the submodule:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/dotfiles-tmux" ~/.config/tmux
```
