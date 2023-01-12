starship init fish | source
set -gx GPG_TTY (tty)
set -gx NPM_CONFIG_PREFIX ~/.npm-global
set -U fish_user_paths ~/.local/bin/ $fish_user_paths
set PATH $PATH /home/arch/.npm-global/bin/
source /opt/asdf-vm/asdf.fish
source ~/.asdf/plugins/java/set-java-home.fish
