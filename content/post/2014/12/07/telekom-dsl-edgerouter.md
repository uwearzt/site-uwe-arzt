+++
title = "Telekom DSL with Ubiquiti EdgeRouter"
date  = "2014-12-07"
type = "blog"
categories = ["Linux", "Other"]
+++

These days i exchanged my aging [FritzBox](http://www.avm.de) with a [Ubiquiti EdgeRouter Lite](http://www.ubnt.com/edgemax/edgerouter-lite/).

Most of the configuration including IPsec is pretty straightforward. The only thing which took a little bit more time is the "Zwangstrennung" (daily shutdown) of the PPPoE connection from my provider. I do the daily reconnect for my connection at 4 am every day.

To achieve that, a script and a daily call from cron is needed. Here is a [article](http://community.ubnt.com/t5/EdgeMAX/Help-configuring-L2PT-VPN-for-pppoe-dynamic-ip/m-p/654911/highlight/true#M19560) from the Ubiquiti Forum which helped a lot. Parts of the script are from there.

#### Create a script *reconnect.sh* under */config/scripts*

~~~~
#!/bin/bash
run=/opt/vyatta/bin/vyatta-op-cmd-wrapper

# reconnect interface
$run disconnect interface pppoe0
sleep 20
$run connect interface pppoe0
sleep 20

# update dyndns
$run update dns dynamic interface pppoe0
sleep 20

# update ipsec
ip=`$run show interfaces | grep pppoe0 | sed 's/^.* \{1\}\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\) .*$/\1/g'`
echo "Current IP is $ip"

source /opt/vyatta/etc/functions/script-template
configure
set vpn l2tp remote-access outside-address $ip
commit
save
~~~~

#### Activate the cron entry inside the console on your EdgeRouter

~~~~
set system task-scheduler task RECONNECT crontab-spec "0 4 * * *"
set system task-scheduler task RECONNECT executable path /config/scripts/reconnect.sh
~~~~

#### Do not forget to have the listen for the <strong>gui</strong> and <strong>ssh</strong> interface only on internal network

~~~~
set service gui listen-address IP-ON-INTERNAL-NETWORK
set service ssh listen-address IP-ON-INTERNAL-NETWORK
~~~~

#### Some other helpful commands

~~~~
# add a static name to the dns resolver
set system static-host-mapping host-name arche inet a.b.c.d
# delete it
delete system static-host-mapping host-name arche

# start dyndns update
update dns dynamic interface pppoe0

# show actual dyndns state
show dns dynamic status

# set the ipsec ip address after it changed i.e. on pppoe
set vpn l2tp remote-access outside-address a.b.c.d
~~~~
