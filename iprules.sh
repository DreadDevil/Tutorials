#!/bin/bash
WAN0="enp1s0f0"
WAN1="enp1s1f1"

function firewall_start
{

# file /etc/modules should have entries nf_conntrack_ftp and nf_nat_ftp

echo 1 > /proc/sys/net/ipv4/ip_forward

# ipv4
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F

# ipv6
ip6tables -t filter -F
ip6tables -t nat -F
ip6tables -t mangle -F

# ipv4
iptables -t filter -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD DROP

# remote access - HQ 
iptables -t filter -A INPUT -s 109.73.40.160/29 -j ACCEPT
iptables -t filter -A INPUT -s 178.238.123.232/30 -j ACCEPT
iptables -t filter -A INPUT -s 79.104.9.100/30 -j ACCEPT

# AS/DC access
iptables -t filter -A INPUT -s 87.245.204.0/28 -j ACCEPT
iptables -t filter -A INPUT -s 87.245.209.0/29 -j ACCEPT
iptables -t filter -A INPUT -s 87.245.209.16/29 -j ACCEPT
iptables -t filter -A INPUT -s 87.245.214.192/28 -j ACCEPT
iptables -t filter -A INPUT -s 154.48.193.80/28 -j ACCEPT
iptables -t filter -A INPUT -s 194.12.53.0/24 -j ACCEPT
iptables -t filter -A INPUT -s 195.219.128.16/28 -j ACCEPT
iptables -t filter -A INPUT -s 185.22.181.192/28 -j ACCEPT
iptables -t filter -A INPUT -s 194.12.48.0/20 -j ACCEPT #
iptables -t filter -A INPUT -s 194.12.56.0/24 -j ACCEPT # complex

iptables -t filter -A INPUT -s 192.168.58.0/24 -j ACCEPT # 

# ssh access inside tunnel
#iptables -t filter -A INPUT -s 172.30.100.0/24 -j ACCEPT
#iptables -t filter -A INPUT -i tun+ -p tcp --dport 22 -j ACCEPT

# vpn access
#iptables -t filter -A INPUT -p udp --dport 1194 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 1194 -j ACCEPT
#iptables -t filter -A INPUT -p udp --dport 1195 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 1195 -j ACCEPT

# prometheus
#iptables -t filter -A INPUT -p tcp --dport 9090 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 9100 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 3000 -j ACCEPT

# base vpn snat admin vpn
#iptables -A FORWARD -s 172.30.100.0/24 -j ACCEPT
#iptables -t nat -o ${WAN0} -A POSTROUTING -s 172.30.100.0/24 -j SNAT --to 185.89.99.243
#for dest in $(grep '^push "route' /etc/openvpn/server/base.conf | sed 's/"//g;/remote_host/d' | awk '{print $3"/"$4}')
#do
#    iptables -t filter -A FORWARD -i tun0 -o ${WAN0} -s 172.30.100.0/24 -d ${dest} -j ACCEPT
#done

# burne vpn snat user vpn
#iptables -A FORWARD -s 172.30.101.0/24 -j ACCEPT
#iptables -t nat -o ${WAN0} -A POSTROUTING -s 172.30.101.0/24 -j SNAT --to 185.89.99.243
#for dest in $(grep '^push "route' /etc/openvpn/server/burne.conf | sed 's/"//g;/remote_host/d' | awk '{print $3"/"$4}')
#do
#    iptables -t filter -A FORWARD -i tun0 -o ${WAN0} -s 172.30.101.0/24 -d ${dest} -j ACCEPT
#done


# iptables -I INPUT -i tun1 -s 172.31.99.6 -j DROP

# temp full inet
#iptables -A FORWARD -s 172.31.99.0/24 -j ACCEPT
#iptables -t nat -A POSTROUTING -s 172.31.99.0/24 -o ${WAN0} -j MASQUERADE

# temp full
# iptables -t filter -A INPUT -j ACCEPT

# finish
return 0
}

function firewall_stop
{

echo 0 > /proc/sys/net/ipv4/ip_forward

# ipv4
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -P FORWARD ACCEPT
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F

# ipv6
ip6tables -t filter -P INPUT ACCEPT
ip6tables -t filter -P OUTPUT ACCEPT
ip6tables -t filter -P FORWARD ACCEPT
ip6tables -t filter -F
ip6tables -t nat -F
ip6tables -t mangle -F

return 0
}

function firewall_usage
{
echo "Usage $0 (start|stop)"

return 0
}

case ${1:-start} in
    start)
          firewall_start
          ;;
    stop)
          firewall_stop
          ;;
    *)
          firewall_usage
          ;;
esac

exit 0
