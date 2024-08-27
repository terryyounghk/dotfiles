# dotfiles

This repo contains the configurations to set up and personalize both my personal and work machines, and intended for recent MacOS only (Sonoma 14.5 or above).

You should fork and tweak to your own preference.

This is using the dotfiles manager [Chezmoi][1] to setup the install and manage the `dotfiles` securely.

## Prerequisites

This repo uses 1Password and [1password-cli][2] supported by `chezmoi` to:

- first determine if current machine is a personal or work machine
- then apply different brew installs and configurations accordingly
- some sensitive configurations use 1Password for storage and retrieval (`dot_gitconfig.tmpl` is one good example of such usage)

Hence the prerequisites include the following:

- Install 1Password
- Install brew
- `brew install 1password-cli chezmoi`

## How to Apply Configurations on Another Machine

For secondary or new, empty machines where you do not use `chezmoi` to edit and manage configurations but only to apply the configurations directly from a repository:

```shell
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply $GITHUB_USERNAME
```

Note that the `/lb` installs `chezmoi` in `./local/bin` instead of `./bin`

You can then subsequently pull changes from the source repo and apply any changes from the repo with:

```shell
chezmoi update
```

## Sharing Configuration Secrets Across Machines

You can share configuration secrets across machines using [chezmoi][1] and 1password.

`dotfiles` are kept on a repo to manage configuration files that set up machine environments.

However, credentials, SSH keys, etc. aren't being tracked for security reasons, and hence, we can leverage `chezmoi` and `1password` to securely share credentials across machines for configurations.

1. Use [chezmoi][1] to track, update and apply your `dotfiles`
2. Save your secrets in `1password` Secure Notes
3. Tell [chezmoi][1] to [read these notes][6] from `1password`

### Use 1password and chezmoi for Configuration Secrets

[chezmoi][1] supports 1Password to store configuration secrets and uses [1password-cli][2] to read them as template functions.

Aside from the guide on [chezmoi > 1Password][3], here are some step-by-steps as an example.

#### Login with 1password-cli

```shell
$ op account add --address $SUBDOMAIN.1password.com --email $EMAIL
$ eval $(op signin --account $SUBDOMAIN)
```

#### Create 1password Vault and Secure Notes

1. Open 1password application and create a dedicated vault called `dotfiles` if not exists yet
2. Create two Secure Notes named `work` and `personal`
3. For each note, add items, such as `email`
4. You can group items into [Sections][5] for better organization

#### Test with 1password-cli

Run the following, and you should see the vault you just created from the previous step:

```shell
$ op vault list
ID          NAME
123456...   dotfiles

$ op read --no-newline op://dotfiles/personal/email
your_personal_email@example.com

$ op read --no-newline op://dotfiles/work/email
your_work_email@example.com
```

#### Read 1Password Secure Notes with 1password-cli

In terms of reading your key-value pairs stored in 1Password, it follows this [Secret Reference Syntax][7] when using [op read][6] or [reading your 1password items in chezmoi][3].

The Secret Reference URI is as follows (note that `section-name` is optional if all your fields can be referenced with unique paths)
```shell
op://<vault-name>/<item-name>/[section-name/]<field-name>
```

If you have duplicate Field Names, one way is to put them into different Sections, and specify the `section-name` in your URI.

Alternatively you can specify the field by its ID as a last resort.

#### Read Multiline Values in 1Password

One example is to output multiple [url.<base\>.insteadOf][4] in your `.gitconfig` file.

First, in 1Password, perform the following (skipping the steps you have already done):

1. Create a vault called `dotfiles`
2. Create a Secure Note called `personal`
3. Add a Section called `git`
4. Add a Text field inside Section `git` called `urls`, and use the following value:

```text
[url "https://github.com/MY_REPO"]
  insteadof = git@github.com:MY_REPO
[url "https://github.com/MY_OTHER_REPO"]
  insteadof = git@github.com:MY_OTHER_REPO
```

Then in `dot_gitconfig.tmpl`, you can output it with the following Go Template snippet:

```go
{{ onepasswordRead "op://dotfiles/personal/git/urls" }}
```

After you run `chezmoi apply` or applied equivalent effects, you should see the values in your targeted file, e.g. `~/.gitconfig`

#### Read Delimited String Values in 1Password

You may have an array of strings, such as having multiple personal machines having different `hostname`.

For example, in 1Password, perform the following (skipping the steps you have already done):

1. Create a vault called `dotfiles`
2. Create a Secure Note called `personal`
3. Add a Section called `general`
4. Add a Text field inside Section `general` called `hostnames` you, and use the following value:

```text
my-mac-001,my-mac-002
```

Then the URI to read it should be as follows:

```shell
op://dotfiles/personal/general/hostnames
```

Then in a `chezmoi template` using Go Template syntax, you can determine if your current machine is among the known personal machine `hostnames` as follows:

```go
{{- $personalHostnames := splitList "," (onepasswordRead "op://dotfiles/personal/general/hostnames") -}}
{{- $personal := has .chezmoi.hostname $personalHostnames -}}
{{- if $personal -}}
This line will output if `personal` is true, and the current hostname is {{- .chezmoi.hostname -}}.
{{- end -}}
```

#### Advanced Chezmoi Go Templates

Based on my use case, a 1Password "item" name represents the "type" (personal / work), we can actually dynamically construct all the Secure Reference URIs and save a lot of `if..else..` logic within the template.

```go
{{- /* ----------------------------------------------------------------------------- */ -}}
{{- /* Snippet to determine if current machine is personal or for work */ -}}
{{- "" -}}
{{- $personalHostnames := splitList "," (onepasswordRead "op://dotfiles/personal/general/hostnames") -}}
{{- $personal := and (has .chezmoi.hostname $personalHostnames) "personal" -}}
{{- $workHostnames := splitList "," (onepasswordRead "op://dotfiles/work/general/hostnames") -}}
{{- $work := and (has .chezmoi.hostname $workHostnames) "work" -}}
{{- $type := or $personal $work -}}
{{- /* ----------------------------------------------------------------------------- */ -}}
{{- if not $type -}}


{{ /* do nothing */ }}
echo "{{- .chezmoi.hostname -}} is not among the listed hostnames."
echo "This script will do nothing."
exit 1984



{{ else }}
{{- /* ----------------------------------------------------------------------------- */ -}}
{{ /* add your main output here */ }}



echo "{{- printf "This should be your %s email:" $type -}}"
echo "{{- onepasswordRead (printf "op://dotfiles/%s/general/email" $type) -}}"

{{ if $work }}
echo "This is an additionally line only seen if this is a work machine"
{{ end }}



{{- end -}}
```

#### More on chezmoi Templates

[chezmoi][1] uses [text/templates][9] and [text template functions from sprig][8] if your templates get more advanced.

## Older Versions of my dotfiles

Older versions of my `dotfiles` use barebone script installations and do not feature using `chezmoi` for dotfiles management.

| Older dotfiles | dotfiles management | zsh framework |
| --- | --- | --- |
| Other repo: [dotfiles-legacy](https://github.com/terryyounghk/dotfiles-legacy) | barebone script install | [oh-my-zsh](https://ohmyz.sh/) |
| Same repo: [v1 branch](https://github.com/terryyounghk/dotfiles/tree/v1) | barebone script install | [zimfw](https://zimfw.sh/) |

[1]: https://chezmoi.io
[2]: https://developer.1password.com/docs/cli/get-started/
[3]: https://www.chezmoi.io/user-guide/password-managers/1password/
[4]: https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
[5]: https://support.1password.com/custom-fields/
[6]: https://developer.1password.com/docs/cli/reference/commands/read/
[7]: https://developer.1password.com/docs/cli/secret-reference-syntax/
[8]: https://masterminds.github.io/sprig/
[9]: https://pkg.go.dev/text/template
