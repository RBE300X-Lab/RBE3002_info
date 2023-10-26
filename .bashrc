# Sample .bashrc - Created by Matthew Haahr (mjhaahr) and evelyn maude (amrelk)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;92m\]\u@\h: \[\033[01\[\033[01;36m\]\W \[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\$ '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias eb="nano ~/.bashrc"
alias sb="source ~/.bashrc"
alias cb="cat ~/.bashrc"

alias HOME="cd ~ ; clear"

export PATH=~/.local/bin:$PATH


## ROS THINGS!
source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash

alias cm="pushd ~/catkin_ws && catkin_make && source devel/setup.bash && popd"

# Change <localhost> to your machine's hostname
# Use ifconfig to find your ip address and nslookup with that ip address to find the hostname 
# On the WPI network it will normally be autoreg-####.dyn.wpi.edu
# (this can be changed at netreg.wpi.edu)
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost

export TURTLEBOT3_MODEL=burger
