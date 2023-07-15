sudo apt update
sudo apt-get install -y tmux


echo "# set scroll history to 8000 lines
set-option -g history-limit 8000

# modern colors
set -g default-terminal "screen-256color"
set-option -ga terminal-overrides ',xterm-256color:Tc'

# unbind the prefix
unbind C-a
set -g prefix M-t
bind M-t send-prefix

# panes
bind -n M-h split-window -h -c "#{pane_current_path}"
bind -n M-j split-window -v -c "#{pane_current_path}"
bind -n M-d kill-pane
bind -n M-n new-session
bind -n M-s choose-session
bind -n M-k copy-mode

bind -n M-Up select-pane -U 
bind -n M-Down select-pane -D
bind -n M-Left select-pane -L 
bind -n M-Right select-pane -R 

bind -n M-H resize-pane -L 2
bind -n M-L resize-pane -R 2
bind -n M-K resize-pane -U 2
bind -n M-J resize-pane -D 2

bind r source-file ~/.tmux.conf

# copy to X clipboard
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-selection-and-cancel
set-window-option -g mode-keys vi

set -s escape-time 0
set -g mode-keys vi
set -g mouse on
set -g status on
set -g focus-events on

# Avoid date/time taking up space
set -g status-right ''
set -g status-right-length 0
" > ~/.tmux.conf

sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd $ZSH_CUSTOM/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd $ZSH_CUSTOM/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions.git
cd $ZSH_CUSTOM/plugins && git clone https://github.com/zsh-users/zsh-completions.git
cd $ZSH_CUSTOM/plugins && git clone https://github.com/djui/alias-tips.git

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
