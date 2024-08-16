# dotfiles

This repo contains the configurations to setup and personzlize my machines.

This is using the dotfile manager [Chezmoi](https://chezmoi.io) to setup the install.

This automated setup is currently only configured for MacOS machines (Sonoma 14.5 or above).

## How to run

```shell
export GITHUB_USERNAME=terryyounghk
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
## Older versions of my dotfiles

| Older dotfiles | dotfiles management | zsh framework |
| --- | --- | --- |
| Other repo: [dotfiles-legacy](https://github.com/terryyounghk/dotfiles-legacy) | barebones script install | [oh-my-zsh](https://ohmyz.sh/) |
| Same repo: [v1 branch](https://github.com/terryyounghk/dotfiles/tree/v1) | barebones script install | [zimfw](https://zimfw.sh/) |

