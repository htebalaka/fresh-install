
source ~/gits/fresh-install/fish/colors.fish
source ~/gits/fresh-install/fish/prompt.fish
source ~/gits/fresh-install/fish/aliases.fish

# if we have tmux run it
# this seems to get run when a tmux pane is opened, so the conditional prevents
# it from running repeatedly
if test -n (which tmux)
    tmux
    if test (tmux display-message -p '#{window_panes}') = '1'
        dev-tmux
    end
end

