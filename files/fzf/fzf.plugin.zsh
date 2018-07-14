## get the real path of plugin
# fzf_zsh_dir="${BASH_SOURCE[0]}" in zsh is equivalent to below
fzf_zsh_dir="${HOME}/.oh-my-zsh/plugins/fzf"

echo "Loading fzf fuzzy completion (custom oh-my-zsh plugin)"
source $fzf_zsh_dir/key-bindings.zsh
source $fzf_zsh_dir/completion.zsh
