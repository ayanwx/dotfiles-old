if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -g "$HOME/.yarn/bin"
fish_add_path -g "$HOME/dotfiles/bin"

alias ls "eza --icons auto"
alias tree "eza --tree --icons auto"
alias du "dust"
alias cat "bat --theme base16 -p"
alias icat "kitty icat"
alias fucking "sudo"
