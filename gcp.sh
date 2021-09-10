mkdir -p /usr/local/gcp ; cd /usr/local/gcp; mkdir installs ;
# Download Remote Software
wget http://teamecho.rocks/repo/gamecpx/v1.4.64/GameCP-Remote-Linux-Version2.tar.gz ;
tar zxvf GameCP-Remote-Linux-Version2.tar.gz ; rm -f GameCP-Remote-Linux-Version2.tar.gz ;chmod +x ./gamecp bin32/gamecp_i386 bin64/gamecp_x64 ;
# Install Service
if [ ! -f /etc/init.d/gamecp ] ; then cp -f gamecp /etc/init.d/gamecp; fi;
if [ -f /sbin/chkconfig ] ; then chkconfig --add gamecp ; chkconfig --level 345 gamecp on ; fi ;
if [ -f /usr/sbin/update-rc.d ] ; then update-rc.d gamecp defaults; update-rc.d gamecp enable; fi ;
# Create Configuration File
if [ -f /usr/local/gcp/gamecp.ini ] ; then rm -f /usr/local/gcp/gamecp.ini; fi;
cat > /usr/local/gcp/gamecp.ini <<DELIM
url=http://albaneso.eu
serverid=10
passphrase=pbtgfdwwsx
debug=off
listenport=240
user_group=default
DELIM
# Open Firewall
if [ -f /sbin/iptables ] ; then  iptables -I INPUT -p tcp --dport 240 -j ACCEPT; iptables -I INPUT -p udp --dport 240 -j ACCEPT; iptables-save; fi ;
# Start GameCP Remote
/etc/init.d/gamecp start
