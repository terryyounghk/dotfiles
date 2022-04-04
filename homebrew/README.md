# Notes on brew

## Some useful commands

To list formulae dependencies:

```shell
brew deps --tree --installed --1

# or

brew deps --include-build --tree --1 $(brew leaves)
```

To list installed casks:

```shell
brew list --cask -1
```

To remove all brew formulae:

```shell
brew remove --force $(brew list --formula)
```

To remove all casks:

```shell
brew remove --cask --force $(brew list)
```

## Some casks with issues

- calibre
