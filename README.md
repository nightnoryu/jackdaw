# :black_bird: jackdaw

My laptop configuration.

## Philosophy

- Minimal visual clutter
- Keyboard-centered controls
- No global development tools - I use mise with pinned versions for each project

## Requirements

- Arch Linux
- git
- [mise](https://mise.jdx.dev)

## Installation

```shell
git clone https://github.com/nightnoryu/jackdaw ~/jackdaw
cd ~/jackdaw
mise bootstrap packages apply   # Install the required packages
mise dot apply                  # Symlink the configs
```
