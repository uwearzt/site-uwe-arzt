extends: post.liquid

title: "Telekom DSL with Ubiquiti EdgeRouter"
date: 07 Dec 2014 00:00:00 +0100

type: "blog"
categories: ["Linux", "Other"]
---

These days i exchanged my aging [FritzBox](http://www.avm.de) with a [Ubiquiti EdgeRouter Lite](http://www.ubnt.com/edgemax/edgerouter-lite/).

Most of the configuration including IPsec is pretty straightforward. The only thing which took a little bit more time is the "Zwangstrennung" (daily shutdown) of the PPPoE connection from my provider. I do the daily reconnect for my connection at 4 am every day.

<!-- more -->

To achieve that, a script and a daily call from cron is needed. Here is a [article](http://community.ubnt.com/t5/EdgeMAX/Help-configuring-L2PT-VPN-for-pppoe-dynamic-ip/m-p/654911/highlight/true#M19560) from the Ubiquiti Forum which helped a lot. Parts of the script are from there.

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

```
set system task-scheduler task RECONNECT crontab-spec "0 4 * * *"
set system task-scheduler task RECONNECT executable path /config/scripts/reconnect.sh
```

#### Do not forget to have the listen for the <strong>gui</strong> and <strong>ssh</strong> interface only on internal network

```
set service gui listen-address IP-ON-INTERNAL-NETWORK
set service ssh listen-address IP-ON-INTERNAL-NETWORK
```

#### Some other helpful commands

```
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

<div class="comments">
<hr class="comments-ruler" />
<div class="comments-level-1">
<p class="comments-author">Dani says</p>
<!-- dbo@chue.li -->
<p class="comments-date">2016/09/09</p>
<p>
Danke für den Artikel, hat mir mit meinem DHCP Problem ("VLAN Interface aktualisiert DHCP Lease nicht richtig" geholfen, zumindest mal bis der Fehler behoben ist).
</p>
<pre>
#!/bin/bash
run=/opt/vyatta/bin/vyatta-op-cmd-wrapper
$run renew dhcp interface eth0.412
</pre>
<p>
-> das ganze dann in Crontab
</p>
<p>
Offenbar bin ich nicht der Einzige mit dem Problem.
<a href="https://community.ubnt.com/t5/EdgeMAX/WAN-dropped-DHCP-renew-fixes-it/td-p/780660">
https://community.ubnt.com/t5/EdgeMAX/WAN-dropped-DHCP-renew-fixes-it/td-p/780660
</a>
</p>
</div>
</div>

<div class="comments">
<div class="comments-level-1">
<p class="comments-author">Timo says</p>
<!-- timo@kosig.net -->
<p class="comments-date">2016/12/29</p>
<p>
Thanks for the article, I needed to set up the daily reconnect as well and it provided a place for me to call curl to update my dynamic DNS entries after a reconnect.
</p>
</p>
</div>
</div>
