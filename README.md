# setup

My terminal and desktop setup for [Omarchy](https://omarchy.org/).

```bash
gh repo clone sharat/setup ~/Work/setup   # or: git clone https://github.com/sharat/setup
~/Work/setup/install.sh
```

The installer is safe to re-run. It backs up files it replaces as `*.bak.<timestamp>`.

## What's in it

| Path | What | How it's installed |
|---|---|---|
| `bash/aliases.sh` | `l`/`ll`/`la` listing and git aliases (`gs`, `gl`, `gdf`, `gco`, `gp`, ...) | sourced from `~/.bashrc` |
| `gh/aliases.yml` | `gh clone`, `gh prc`, `gh ck`, `gh mg`, `gh open`, ... | `gh alias import` |
| `hypr/looknfeel.lua` | Apple-style squircle window corners, gaps | symlinked into `~/.config/hypr/` |
| `themes/atom-night` | Atom Dark-inspired theme (Tokyo Night base) | built into `~/.config/omarchy/themes/` |
| `themes/atom-light` | Atom One Light theme (Catppuccin Latte base) | built into `~/.config/omarchy/themes/` |

Themes only store the files that differ from their stock base (named in `base`);
wallpapers and preview images come from the stock theme on the machine.

Apply a theme with `omarchy theme set atom-night` or `omarchy theme set atom-light`.
