# setup

My terminal and desktop setup for macOS and [Omarchy](https://omarchy.org/).

```bash
gh repo clone sharat/setup ~/Work/setup   # or: git clone https://github.com/sharat/setup
~/Work/setup/install.sh
```

`install.sh` detects the platform, runs `common/install.sh`, then `mac/install.sh` or
`omarchy/install.sh`. It is safe to re-run, and backs up files it replaces as `*.bak.<timestamp>`.

## Layout

| Path | What | How it's installed |
|---|---|---|
| `common/aliases.sh` | `l`/`ll`/`la` listing and git aliases (`gs`, `gl`, `gdf`, `gco`, `gp`, ...) | sourced from `~/.zshrc` or `~/.bashrc` |
| `common/gh-aliases.yml` | `gh clone`, `gh prc`, `gh ck`, `gh mg`, `gh open`, ... | `gh alias import` |
| `mac/` | macOS-specific setup (to be filled in) | `mac/install.sh` |
| `omarchy/hypr/looknfeel.lua` | Apple-style squircle window corners, gaps | symlinked into `~/.config/hypr/` |
| `omarchy/themes/atom-night` | Atom Dark-inspired theme (Tokyo Night base) | built into `~/.config/omarchy/themes/` |
| `omarchy/themes/atom-light` | Atom One Light theme (Catppuccin Latte base) | built into `~/.config/omarchy/themes/` |

Themes only store the files that differ from their stock base (named in `base`);
wallpapers and preview images come from the stock theme on the machine.

After adding gh aliases, save them with:

```bash
gh alias list | sed -E "s/^([^:]+): (.*)$/\1: '\2'/" > common/gh-aliases.yml
```
