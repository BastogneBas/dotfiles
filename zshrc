# Set up the prompt

autoload -Uz promptinit
promptinit
prompt bart

setopt histignorealldups

#setopt checkwinsize

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Window Title
case $TERM in
  xterm*|rxvt*)
    precmd () { print -Pn "\e]0;%n@%M: %~\a" }
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias llh='ls -lh'

# Use emacs keybindings even if our EDITOR is set to vi

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init() {
		echoti smkx
	}
	function zle-line-finish() {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

bindkey -e
bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey '[1;2C' forward-word	# Shift+right
bindkey '[1;2D' backward-word	# Shift+left

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias ChangeAudioToHdmi='pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo'
alias ChangeAudioToHdmi2='pacmd set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo'
alias ChangeAudioToAnalog='pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo '
alias ChangeAudioToAnalogHeadphones='pacmd set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-headphones'
alias ChangeAudioToAnalogSpeaker='pacmd set-sink-port alsa_output.pci-0000_00_1f.3.analog-stereo analog-output-speaker'
alias cava='urxvt -tr +sb -fn "xft:Terminus:size=3" -e /bin/cava'
#alias prtscrn='maim -m 1 | xclip -selection clipboard -t image/png'
#alias prtsel='maim -s -m 1 | xclip -selection clipboard -t image/png'
alias Ub='cd ~/Dokumentoj/Uberprachtige-KBS-game/'
alias kbs='cd ~/Dokumentoj/MIDIBar/'
alias rtos='cd ~/Dokumentoj/RTOS/Huiswerkopdracht/'
alias SetupMonitors='xrandr --output eDP1 --auto --output DP2 --auto --right-of eDP1 --primary --output HDMI1 --auto --right-of DP2'
#alias playTuinCamera='ffplay -v quiet -i rtsp://syno:0b722ccc654d26ff0dbc7db9b34324cd@192.168.10.10:554/Sms=1.unicast &'
#alias playVoortuinCamera='ffplay -v quiet -i rtsp://syno:83bd80613a2c7f011c5a70381dee2a8b@192.168.10.10:554/Sms=2.unicast &'

export XDG_CURRENT_DESKTOP=Unity
