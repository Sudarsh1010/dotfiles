# source ~/.config/fish/themes/kanagawa-dragon.fish
# Disable greeting
set -g fish_greeting

# Directories
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path
abbr mkdir 'mkdir -p'

# Paths
set -Ux PYENV_ROOT $HOME/.pyenv
set -xg PYTHONPATH $HOME/workspace/predigle/pluto/api-pluto-pmi

set --export PATH \
    $HOME/.pyenv/shims \
    $HOME/.pyenv/bin \
    $HOME/.bun/bin \
    /usr/local/go/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $HOME/.nvm/versions/node/v20.17.0/bin \
    /opt/homebrew/bin \
    /usr/local/bin \
    /usr/bin \
    /bin \
    /usr/sbin \
    /sbin \
    /opt/homebrew/sbin

# Init in background
function init_background --on-event fish_prompt
    # starship init fish | source &
    pyenv init --path | source &
end