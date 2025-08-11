# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_bombadil_global_optspecs
	string join \n h/help V/version
end

function __fish_bombadil_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_bombadil_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_bombadil_using_subcommand
	set -l cmd (__fish_bombadil_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c bombadil -n "__fish_bombadil_needs_command" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_needs_command" -s V -l version -d 'Print version'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "install" -d 'Link a given dotfile directory settings to "XDG_CONFIG_DIR/bombadil.toml"'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "clone" -d 'Install dotfiles from a remote git repository to a target folder'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "link" -d 'Symlink a copy of your dotfiles and inject variables according to bombadil.toml settings'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "unlink" -d 'Remove all symlinks defined in your bombadil.toml'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "watch" -d 'Watch dotfiles and automatically run link on changes'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "add-secret" -d 'Add a secret var to bombadil environment'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "get" -d 'Get metadata about dots, hooks, path, profiles, or vars'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "generate-completions" -d 'Generate shell completions Generate shell completions'
complete -c bombadil -n "__fish_bombadil_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c bombadil -n "__fish_bombadil_using_subcommand install" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand clone" -s r -l remote -d 'Remote repository address, either http or ssh' -r
complete -c bombadil -n "__fish_bombadil_using_subcommand clone" -s t -l target -d 'Target destination, repository name by default' -r -F
complete -c bombadil -n "__fish_bombadil_using_subcommand clone" -s p -l profiles -d 'A list of comma-separated profiles to activate' -r
complete -c bombadil -n "__fish_bombadil_using_subcommand clone" -s f -l force -d 'Force symlink creation even if the target already exists, a backup will be created'
complete -c bombadil -n "__fish_bombadil_using_subcommand clone" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand link" -s p -l profiles -d 'A list of comma-separated profiles to activate' -r -f -a ""
complete -c bombadil -n "__fish_bombadil_using_subcommand link" -s f -l force -d 'Force symlink creation even if the target already exists, a backup will be created'
complete -c bombadil -n "__fish_bombadil_using_subcommand link" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand unlink" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand watch" -s p -l profiles -d 'A list of comma-separated profiles to activate' -r -f -a ""
complete -c bombadil -n "__fish_bombadil_using_subcommand watch" -s f -l force -d 'Force symlink creation even if the target already exists, a backup will be created'
complete -c bombadil -n "__fish_bombadil_using_subcommand watch" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand add-secret" -s k -l key -d 'Key of the secret variable to create' -r
complete -c bombadil -n "__fish_bombadil_using_subcommand add-secret" -s v -l value -r
complete -c bombadil -n "__fish_bombadil_using_subcommand add-secret" -s f -l file -d 'Path of the var file to modify' -r
complete -c bombadil -n "__fish_bombadil_using_subcommand add-secret" -s a -l ask -d 'Get the secret value from stdin'
complete -c bombadil -n "__fish_bombadil_using_subcommand add-secret" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand get" -s n -l no-color
complete -c bombadil -n "__fish_bombadil_using_subcommand get" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand generate-completions" -s h -l help -d 'Print help'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "install" -d 'Link a given dotfile directory settings to "XDG_CONFIG_DIR/bombadil.toml"'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "clone" -d 'Install dotfiles from a remote git repository to a target folder'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "link" -d 'Symlink a copy of your dotfiles and inject variables according to bombadil.toml settings'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "unlink" -d 'Remove all symlinks defined in your bombadil.toml'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "watch" -d 'Watch dotfiles and automatically run link on changes'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "add-secret" -d 'Add a secret var to bombadil environment'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "get" -d 'Get metadata about dots, hooks, path, profiles, or vars'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "generate-completions" -d 'Generate shell completions Generate shell completions'
complete -c bombadil -n "__fish_bombadil_using_subcommand help; and not __fish_seen_subcommand_from install clone link unlink watch add-secret get generate-completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'

