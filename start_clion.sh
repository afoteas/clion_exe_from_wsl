echo "clion is starting..."
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0
sh /opt/clion-*/bin/clion.sh
