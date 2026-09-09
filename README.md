# Dotfiles

Personal shell, editor, terminal, and desktop configuration files, plus scripts
in `bin/`.

## Install with GNU Stow

Install Git and GNU Stow using your package manager:

```sh
# macOS (Homebrew)
brew install git stow

# Debian / Ubuntu
sudo apt install git stow
```

Clone the repository, or use your existing checkout:

```sh
mkdir -p ~/source
git clone https://github.com/AlbertVeli/dotfiles.git ~/source/dotfiles
cd ~/source
```

The whole `dotfiles` directory is one Stow package. Run the following commands
from its parent directory (`~/source` in this example). The explicit target
ensures links are installed in your home directory.

Preview the links without changing anything:

```sh
stow --simulate --verbose --target="$HOME" \
  --ignore='^(\.git.*|README\.md|UNLICENSE|.*_cheatsheet\.txt|misc|source)$' dotfiles
```

Review the output, then install:

```sh
stow --verbose --target="$HOME" \
  --ignore='^(\.git.*|README\.md|UNLICENSE|.*_cheatsheet\.txt|misc|source)$' dotfiles
```

This links configuration files and `bin/` into your home directory. The ignore
pattern excludes Git metadata, documentation, reference files, and the `source/`
tree; `.gitconfig` is also excluded because it contains personal Git settings.
The SecLists submodule is not needed for this installation.

If Stow reports a conflict with an existing file, back up or move that specific
file outside the target path, then preview again. Stow does not overwrite existing
files. Review personal settings, especially `.ssh/config`, before installing.
Keep the checkout in place: the installed links point to it. Stow only creates
links; install the applications and any configuration dependencies separately.

To remove the links, run from the same parent directory:

```sh
stow --delete --verbose --target="$HOME" \
  --ignore='^(\.git.*|README\.md|UNLICENSE|.*_cheatsheet\.txt|misc|source)$' dotfiles
```

This leaves the files in the repository intact.
