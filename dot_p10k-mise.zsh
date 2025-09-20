# -------------------------------------------------------------
# Add p10k segment for Mise (https://mise.jdx.dev/) (FKA rtx)
# See: https://github.com/romkatv/powerlevel10k/issues/2212
#
# What's been done here are roughly as follows:
#
# 1. Copied ASDF section from here:
#    https://github.com/romkatv/powerlevel10k/blob/36f3045d69d1ba402db09d09eb12b42eebe0fa3b/config/p10k-lean.zsh#L570-L708
#
# 2. Copied and modified promise_mise from here:
#    https://github.com/romkatv/powerlevel10k/issues/2212
#
# 3. Replaced all "ASDF" with "MISE" (upper/lower cases)
#
# 4. Some minor fixes applied; adjust to your own needs
# -------------------------------------------------------------

function prompt_mise() {
  # -----------------------------------------------------------
  # Pick one of the following
  #
  # show all:
  # local plugins=("${(@f)$(mise ls --current --offline 2>/dev/null | awk '{if ($1) print $1, $2}')}")
  #
  # show least:
  # local plugins=("${(@f)$(mise ls --current --offline 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" && $3!="(missing)" {if ($1) print $1, $2}')}")
  #
  # no symlink, no missing:
  # local plugins=("${(@f)$(mise ls --current --offline 2>/dev/null | awk '!/\(symlink\)/ && $3!="(missing)" {if ($1) print $1, $2}')}")
  #
  # no missing only:
  local plugins=("${(@f)$(mise ls --current --offline 2>/dev/null | awk '! $3!="(missing)" {if ($1) print $1, $2}')}")
  # -----------------------------------------------------------

  local plugin
  for plugin in ${(k)plugins}; do
    local parts=("${(@s/ /)plugin}")
    local TOOL=${(U)parts[1]/-/_}  # Uppercase and replace '-' with '_'
    local version=${parts[2]}

    # for help, run `p10k help segment`
    p10k segment -r -i "${TOOL}_ICON" -s $TOOL -t "$version"
  done
}

###############[ mise: (https://mise.jdx.dev/) ]###############
# Default mise color. Only used to display tools for which there is no color override (see below).
# Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_MISE_${TOOL}_FOREGROUND.
typeset -g POWERLEVEL9K_MISE_FOREGROUND=6

# There are four parameters that can be used to hide mise tools. Each parameter describes
# conditions under which a tool gets hidden. Parameters can hide tools but not unhide them. If at
# least one parameter decides to hide a tool, that tool gets hidden. If no parameter decides to
# hide a tool, it gets shown.
#
# Special note on the difference between POWERLEVEL9K_MISE_SOURCES and
# POWERLEVEL9K_MISE_PROMPT_ALWAYS_SHOW. Consider the effect of the following commands:
#
#   mise local  python 3.8.1
#   mise global python 3.8.1
#
# After running both commands the current python version is 3.8.1 and its source is "local" as
# it takes precedence over "global". If POWERLEVEL9K_MISE_PROMPT_ALWAYS_SHOW is set to false,
# it'll hide python version in this case because 3.8.1 is the same as the global version.
# POWERLEVEL9K_MISE_SOURCES will hide python version only if the value of this parameter doesn't
# contain "local".

# Hide tool versions that don't come from one of these sources.
#
# Available sources:
#
# - shell   `mise current` says "set by MISE_${TOOL}_VERSION environment variable"
# - local   `mise current` says "set by /some/not/home/directory/file"
# - global  `mise current` says "set by /home/username/file"
#
# Note: If this parameter is set to (shell local global), it won't hide tools.
# Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_MISE_${TOOL}_SOURCES.
typeset -g POWERLEVEL9K_MISE_SOURCES=(shell local global)

# If set to false, hide tool versions that are the same as global.
#
# Note: The name of this parameter doesn't reflect its meaning at all.
# Note: If this parameter is set to true, it won't hide tools.
# Tip:  Override this parameter for ${TOOL} with POWERLEVEL9K_MISE_${TOOL}_PROMPT_ALWAYS_SHOW.
typeset -g POWERLEVEL9K_MISE_PROMPT_ALWAYS_SHOW=false

# If set to false, hide tool versions that are equal to "system".
#
# Note: If this parameter is set to true, it won't hide tools.
# Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_MISE_${TOOL}_SHOW_SYSTEM.
typeset -g POWERLEVEL9K_MISE_SHOW_SYSTEM=true

# If set to non-empty value, hide tools unless there is a file matching the specified file pattern
# in the current directory, or its parent directory, or its grandparent directory, and so on.
#
# Note: If this parameter is set to empty value, it won't hide tools.
# Note: SHOW_ON_UPGLOB isn't specific to mise. It works with all prompt segments.
# Tip: Override this parameter for ${TOOL} with POWERLEVEL9K_MISE_${TOOL}_SHOW_ON_UPGLOB.
#
# Example: Hide nodejs version when there is no package.json and no *.js files in the current
# directory, in `..`, in `../..` and so on.
#
typeset -g POWERLEVEL9K_MISE_SHOW_ON_UPGLOB=

typeset -g POWERLEVEL9K_MISE_1PASSWORD_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_1PASSWORD_FOREGROUND=6
typeset -g POWERLEVEL9K_MISE_1PASSWORD_VISUAL_IDENTIFIER_EXPANSION='op'
typeset -g POWERLEVEL9K_MISE_1PASSWORD_SHOW_ON_UPGLOB='neverevergonnaever-show'

typeset -g POWERLEVEL9K_MISE_BUF_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_BUF_FOREGROUND=87
typeset -g POWERLEVEL9K_MISE_BUF_VISUAL_IDENTIFIER_EXPANSION='buf'
typeset -g POWERLEVEL9K_MISE_BUF_SHOW_ON_UPGLOB='proto'

typeset -g POWERLEVEL9K_MISE_CHEZMOI_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_CHEZMOI_FOREGROUND=82
typeset -g POWERLEVEL9K_MISE_CHEZMOI_VISUAL_IDENTIFIER_EXPANSION='cm'
typeset -g POWERLEVEL9K_MISE_CHEZMOI_SHOW_ON_UPGLOB='.chezmoi*'

# Ruby version from mise.
typeset -g POWERLEVEL9K_MISE_RUBY_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=168
# typeset -g POWERLEVEL9K_MISE_RUBY_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_RUBY_SHOW_ON_UPGLOB='*.foo|*.bar'

# Python version from mise.
typeset -g POWERLEVEL9K_MISE_PYTHON_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=33
typeset -g POWERLEVEL9K_MISE_PYTHON_VISUAL_IDENTIFIER_EXPANSION='py'
# typeset -g POWERLEVEL9K_MISE_PYTHON_VISUAL_IDENTIFIER_EXPANSION=$'\ue606'
typeset -g POWERLEVEL9K_MISE_PYTHON_SHOW_ON_UPGLOB='*.*py*'

# Go version from mise.
typeset -g POWERLEVEL9K_MISE_GO_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_GO_FOREGROUND=225
typeset -g POWERLEVEL9K_MISE_GO_VISUAL_IDENTIFIER_EXPANSION='go'
# typeset -g POWERLEVEL9K_MISE_GO_VISUAL_IDENTIFIER_EXPANSION=$'\ue65e'
typeset -g POWERLEVEL9K_MISE_GO_SHOW_ON_UPGLOB='*.go'

# Yarn version from mise.
typeset -g POWERLEVEL9K_MISE_YARN_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_YARN_FOREGROUND=178
typeset -g POWERLEVEL9K_MISE_YARN_VISUAL_IDENTIFIER_EXPANSION='yarn'
# typeset -g POWERLEVEL9K_MISE_YARN_VISUAL_IDENTIFIER_EXPANSION=$'\ue6a7'
# typeset -g POWERLEVEL9K_MISE_YARN_SHOW_ON_UPGLOB='*.js|package.json|*.ts|node_modules|yarn.lock|.tool-versions|.yarnrc|.yarnrc.yml|.yarn|.pnp.js'

# Node version from mise.
typeset -g POWERLEVEL9K_MISE_NODE_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_NODE_FOREGROUND=165
typeset -g POWERLEVEL9K_MISE_NODE_VISUAL_IDENTIFIER_EXPANSION='node'
# typeset -g POWERLEVEL9K_MISE_NODE_VISUAL_IDENTIFIER_EXPANSION=$'\ued0d'
# typeset -g POWERLEVEL9K_MISE_NODE_SHOW_ON_UPGLOB='*.js|package.json|*.ts|node_modules'

# Rust version from mise.
typeset -g POWERLEVEL9K_MISE_RUST_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_RUST_FOREGROUND=214
typeset -g POWERLEVEL9K_MISE_RUST_VISUAL_IDENTIFIER_EXPANSION='rs' # $'\ue68b'
typeset -g POWERLEVEL9K_MISE_RUST_SHOW_ON_UPGLOB='Cargo.toml|*.rs'

# .NET Core version from mise.
typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_FOREGROUND=134
# typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_DOTNET_SHOW_ON_UPGLOB='*.foo|*.bar'

# Flutter version from mise.
typeset -g POWERLEVEL9K_MISE_FLUTTER_FOREGROUND=38
# typeset -g POWERLEVEL9K_MISE_FLUTTER_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_FLUTTER_SHOW_ON_UPGLOB='*.foo|*.bar'

# Lua version from mise.
typeset -g POWERLEVEL9K_MISE_LUA_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_LUA_FOREGROUND=87
typeset -g POWERLEVEL9K_MISE_LUA_VISUAL_IDENTIFIER_EXPANSION='lua' # $'\ue620'
typeset -g POWERLEVEL9K_MISE_LUA_SHOW_ON_UPGLOB='*.lua'

# Java version from mise.
typeset -g POWERLEVEL9K_MISE_JAVA_FOREGROUND=32
# typeset -g POWERLEVEL9K_MISE_JAVA_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_JAVA_SHOW_ON_UPGLOB='*.foo|*.bar'

# Perl version from mise.
typeset -g POWERLEVEL9K_MISE_PERL_FOREGROUND=67
# typeset -g POWERLEVEL9K_MISE_PERL_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_PERL_SHOW_ON_UPGLOB='*.foo|*.bar'

# Erlang version from mise.
typeset -g POWERLEVEL9K_MISE_ERLANG_FOREGROUND=125
# typeset -g POWERLEVEL9K_MISE_ERLANG_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_ERLANG_SHOW_ON_UPGLOB='*.foo|*.bar'

# Elixir version from mise.
typeset -g POWERLEVEL9K_MISE_ELIXIR_FOREGROUND=129
# typeset -g POWERLEVEL9K_MISE_ELIXIR_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_ELIXIR_SHOW_ON_UPGLOB='*.foo|*.bar'

# Postgres version from mise.
typeset -g POWERLEVEL9K_MISE_POSTGRES_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_POSTGRES_FOREGROUND=31
typeset -g POWERLEVEL9K_MISE_POSTGRES_VISUAL_IDENTIFIER_EXPANSION='pg' # $'\ue76e'
typeset -g POWERLEVEL9K_MISE_POSTGRES_SHOW_ON_UPGLOB='*.sql'

# PHP version from mise.
typeset -g POWERLEVEL9K_MISE_PHP_PROMPT_ALWAYS_SHOW=false
typeset -g POWERLEVEL9K_MISE_PHP_FOREGROUND=99
typeset -g POWERLEVEL9K_MISE_PHP_VISUAL_IDENTIFIER_EXPANSION='php' # $'\ued6d'
typeset -g POWERLEVEL9K_MISE_PHP_SHOW_ON_UPGLOB='*.php'

# Haskell version from mise.
typeset -g POWERLEVEL9K_MISE_HASKELL_FOREGROUND=172
# typeset -g POWERLEVEL9K_MISE_HASKELL_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_HASKELL_SHOW_ON_UPGLOB='*.foo|*.bar'

# Julia version from mise.
typeset -g POWERLEVEL9K_MISE_JULIA_FOREGROUND=70
# typeset -g POWERLEVEL9K_MISE_JULIA_VISUAL_IDENTIFIER_EXPANSION='⭐'
# typeset -g POWERLEVEL9K_MISE_JULIA_SHOW_ON_UPGLOB='*.foo|*.bar'
