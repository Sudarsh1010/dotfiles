# source ~/.config/fish/themes/kanagawa-dragon.fish
# Disable greeting
set -g fish_greeting

# Directories
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias cd='zoxide' # list folder as tree

# Handy change dir shortcuts
abbr .. 'zoxide ..'
abbr ... 'zoxide ../..'
abbr .3 'zoxide ../../..'
abbr .4 'zoxide ../../../..'
abbr .5 'zoxide ../../../../..'

# Always mkdir a path
abbr mkdir 'mkdir -p'

set --export PATH \
    $HOME/.bun/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $HOME/.nvm/versions/node/v22.20.0/bin \
    /opt/homebrew/bin \
    /opt/homebrew/sbin \
    /usr/local/go/bin \
    /usr/local/bin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin \
    /opt/homebrew/opt/postgresql@18/bin:$PATH

set --export JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

set --export ANDROID_HOME $HOME/Library/Android/sdk

set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH

set -gx CPPFLAGS -I/opt/homebrew/opt/openjdk/include

set --export XDG_CONFIG_HOME \
    $HOME/.config

set -x PATH $HOME/bin $PATH
set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock

# Init in background
function init_background --on-event fish_prompt
    starship init fish | source &
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/sudarsh/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
