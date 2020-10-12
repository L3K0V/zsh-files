
zssh() {
  ssh "$@" -t zsh
}

hgrep () {
    history | egrep --color=auto --recursive "$@" | egrep --color=auto --recursive -v "hgrep $@"
}

keyhash() {
  keytool -exportcert -keystore $1 -alias $2 | openssl sha1 -binary | openssl base64
}

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }