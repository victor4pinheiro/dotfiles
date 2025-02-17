set TTY1 (tty)

if status --is-login
	eval $(keychain --eval --quiet id_ed25519 ~/.ssh/id_ed25519)
	if test (tty) = /dev/tty1
		exec sway
	end
end


## Alias
alias ls="eza"
alias i="sudo pacman -Syu"
alias auri="yay -Syu"
alias lg="lazygit"

## Envs
set -gx GPG_TTY (tty)
#set -gx NPM_CONFIG_PREFIX ~/.npm-global
set -U fish_user_paths ~/.local/bin/ $fish_user_paths
set PATH $PATH $HOME/.dotnet/tools
#set PATH $PATH /home/arch/.npm-global/bin/

## Completions
# uv generate-shell-completion fish | source
# ~/.config/fish/config.fish
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

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
