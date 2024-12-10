set TTY1 (tty)

if status --is-login
    eval $(keychain --eval --quiet id_ed25519 ~/.ssh/id_ed25519)
    if test (tty) = /dev/tty1
        exec sway
    end
end


## Alias
alias ls="eza"
alias i="sudo pacman"
alias auri="yay -Syu"
alias lg="lazygit"

## Envs
set -gx GPG_TTY (tty)
set -gx NPM_CONFIG_PREFIX ~/.npm-global
set -U fish_user_paths ~/.local/bin/ $fish_user_paths
set PATH $PATH /home/arch/.npm-global/bin/

## Completions
source /opt/asdf-vm/asdf.fish
source ~/.asdf/plugins/java/set-java-home.fish
uv generate-shell-completion fish | source
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"


## Start programs
starship init fish | source
zoxide init fish | source


## File explorer
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
