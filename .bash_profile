export AWS_ELB_HOME=$HOME/builds/3rdparty/ElasticLoadBalancing-1.0.17.0

# MacPorts Installer addition on 2013-05-28_at_17:51:33: adding an appropriate PATH variable for use with MacPorts.
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH:$AWS_ELB_HOME/bin
# Finished adapting your PATH environment variable for use with MacPorts.

source ~/.git-completion.bash
source ~/.bash_aliases
source ~/.colorize-maven.sh

export LUA_PATH=$HOME/'.lua/packages/?.lua;?.lua'
export LUA_CPATH=$HOME/'.lua/libs/?.so;?.so'
export JAVA_HOME=$(/usr/libexec/java_home)
export AWS_CREDENTIAL_FILE=$HOME/builds/mosaic-ec2/AWSAccessKey-kkyzivat@mosaicarchive.com
export PYTHONPATH=$HOME/lib/python:$HOME/lib/python2.7/site-packages
