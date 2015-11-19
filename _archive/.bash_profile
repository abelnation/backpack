
echo "Reading .bash_profile"

# abelbin scripts
PATH="~/abelbin:${PATH}"

PATH="/usr/local/bin:${PATH}"
export PATH

# iTerm Shell Tools 
source /Users/aallison/.iterm2_shell_integration.bash

# Android Dev
export ANDROID_HOME=/Users/aallison/Workspace/android/sdk
ANDROID_TOOLS=$ANDROID_HOME/tools
ANDROID_PTOOLS=$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PTOOLS

# Rjar recursive jar tool
export RJAR_HOME=/Users/aallison/Workspace/growth/switchboard/scripts/rjarsrc/
export PATH=$PATH:$RJAR_HOME/bin

# Gatling stress tests env vars
export GATLING_HOME=/Users/aallison/Workspace/gatling-2.1.3

# Golang env vars
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Workspace/go

# Hadoop/Hive installed via brew
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.2.1
export HIVE_HOME=/usr/local/Cellar/hive/0.12.0/libexec
# export SCALA_HOME=/Users/aallison/Workspace/growth/ymobiledata_starter/setup/scala-2.9.3/
export SPARK_HOME=/Users/aallison/Workspace/growth/ymobiledata_starter/setup/spark-0.8.1-incubating
# see: http://stackoverflow.com/questions/7134723/hadoop-on-osx-unable-to-load-realm-info-from-scdynamicstore
# export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc="
HADOOP_OPTS="${HADOOP_OPTS} -Djava.security.krb5.conf=/dev/null"

# Java JDK
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME/bin:$PATH"

# NodeJS
export NODE_PATH='/usr/local/lib/node_modules'

# Ruby
# Use new version of ruby installed via homebrew
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Homebrew Python
# export PYTHONHOME="/usr/local/"
export PYTHONPATH="/System/Library/Frameworks/Python.framework/Versions/2.5/Extras/lib/python:$PYTHONPATH"

# NVM Node version management
[ -s "/Users/aallison/.nvm/nvm.sh" ] && . "/Users/aallison/.nvm/nvm.sh" # This loads nvm
nvm alias default 0.10.33
nvm use default

# Scala
# export SCALA_HOME="/Users/aallison/Workspace/scala/scala-latest"
export SCALA_HOME="/use/local/Cellar/scala/2.11.5"
export PATH="$PATH:$SCALA_HOME/bin"

