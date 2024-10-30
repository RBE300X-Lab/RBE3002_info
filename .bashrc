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

# WARNING: AS OF 10/30/2024, IT TAKES 30+ MINUTES FOR YOUR COMPUTER TO 
# RECEIVE A DNS RECORD IF IT DOESN'T ALREADY HAVE ONE!!!! IF YOU RELY ON
# YOUR HOSTNAME FOR SETTING YOUR ROS_MASTER_URI, IT MAY TAKE 30 MINUTES 
# FOR YOUR SYSTEM TO WORK!!

# Use this when the DNS gets fixed :P
# export ROS_MASTER_URI=http://localhost:11311
# export ROS_HOSTNAME=localhost

# While the DNS server is still borked, use this in YOUR bashrc:
export ROS_MASTER_URI=http://$(hostname -I | xargs):11311
export ROS_HOSTNAME=$(hostname -I | xargs)

# In your TURTLEBOT's bashrc, set ROS_HOSTNAME normally:
# export ROS_HOSTNAME=toad.dyn.wpi.edu

# In your TURTLEBOT's bashrc, set ROS_MASTER_URI to the IP address of the ssh
# client that is currently signed in.
# export ROS_MASTER_URI=http://$(echo $SSH_CLIENT | awk '{ print $1}'):11311

export TURTLEBOT3_MODEL=burger

# Some aliases for network stuff
ltb() {  # nslookup a turtlebot
        nslookup $1.dyn.wpi.edu
}
ptb() {  # ping a turtlebot
        ping $1.dyn.wpi.edu
}

