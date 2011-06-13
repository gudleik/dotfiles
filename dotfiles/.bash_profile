source ~/.environment

# Prompt
GIT_PROMPT="\[\033[01;33m\]\$(git branch 2>/dev/null|cut -f2 -d\* -s)\[\033[00m\]"
RVM_PROMPT="\[\033[00;30m\]\$(~/.rvm/bin/rvm-prompt)"
PATH_PROMPT="\[\033[00;35m\]\w\[\033[00m\]\[\033[01;33m\]"
export PS1="${PATH_PROMPT}${GIT_PROMPT} ${RVM_PROMPT}\[\033[00;39m\]\n$ "

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
# Amazon

#export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
#export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
#export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-57419/jars"

source ~/.bashrc
