+++
title = "Telekom DSL with Ubiquiti EdgeRouter"
date = 2014-12-07

aliases = [
  "4232f760"
]

[taxonomies]
categories = ["linux"]
+++

These days i exchanged my aging [FritzBox](https://www.avm.de) with a [Ubiquiti EdgeRouter Lite](https://www.ubnt.com/edgemax/edgerouter-lite/).

Most of the configuration including IPsec is pretty straightforward. The only thing which took a little bit more time is the "Zwangstrennung" (daily shutdown) of the PPPoE connection from my provider. I do the daily reconnect for my connection at 4 am every day.

<!-- more -->

To achieve that, a script and a daily call from cron is needed. Here is a [article](https://community.ui.com/questions/Help-configuring-L2PT-VPN-for-pppoe-dynamic-ip/111f9e13-58b0-401e-9b2b-8a4a043efb74) from the Ubiquiti Forum which helped a lot. Parts of the script are from there.

#### Create a script *reconnect.sh* under */config/scripts*

```bash
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
```

#### Activate the cron entry inside the console on your EdgeRouter

```bash
set system task-scheduler task RECONNECT crontab-spec "0 4 * * *"
set system task-scheduler task RECONNECT executable path /config/scripts/reconnect.sh
```

#### Do not forget to have the listen for the <strong>gui</strong> and <strong>ssh</strong> interface only on internal network

```bash
set service gui listen-address IP-ON-INTERNAL-NETWORK
set service ssh listen-address IP-ON-INTERNAL-NETWORK
```

#### Some other helpful commands

```bash
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
```

---

###### Dani says 2016/09/09
<!-- dbo@chue.li -->
Danke für den Artikel, hat mir mit meinem DHCP Problem ("VLAN Interface aktualisiert DHCP Lease nicht richtig" geholfen, zumindest mal bis der Fehler behoben ist).

```bash
#!/bin/bash
run=/opt/vyatta/bin/vyatta-op-cmd-wrapper
$run renew dhcp interface eth0.412
```

-> das ganze dann in Crontab

Offenbar bin ich nicht der Einzige mit dem Problem.
<https://community.ubnt.com/t5/EdgeMAX/WAN-dropped-DHCP-renew-fixes-it/td-p/780660>

###### Timo says 2016/12/29
<!-- timo@kosig.net -->
Thanks for the article, I needed to set up the daily reconnect as well and it provided a place for me to call curl to update my dynamic DNS entries after a reconnect.
