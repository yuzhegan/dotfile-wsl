set -x hostip (cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
function hp
	 alias ALL_PROXY="export ALL_PROXY=http://$hostip:58591" 
	 ALL_PROXY
end
