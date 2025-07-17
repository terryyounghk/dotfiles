# Managing yazi plugins in Chezmoi

## Adding to your dotfiles

You do not need to include `~/.config/yazi/plugins` into your `dotfiles`.

You only need to include `~/.config/yazi/package.toml`.

You can add/delete yazi plugins as usual with `ya pkg ...`.

Just make sure to run this afterwards:

```
chezmoi re-add ~/.config/yazi/package.toml
```

## Updating from your dotfiles

After you run `chezmoi update`, run this so that yazi updates the plugins according to the updated yazi `package.toml`, and you're good to go:

```
ya pkg install
```
