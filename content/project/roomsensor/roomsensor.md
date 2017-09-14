extends: default.liquid
title: "RoomSensor"
shortlink: 425815d0
---

# Overview

Inside our new home we have an KNX <http://www.knx.org> automation bus. I have not found an nice looking "RoomSensor" which has the following sensor equipment:

* temperature
* humidity
* brightness
* passive infrared motion (PIR)
* smoke detector
* CO2

<!-- more -->

# Components

so i decided to build my own. After looking what is possible i choosed the following components:


* ARM Cortex-M3 microcontroller
* SIM-KNX bus coupling from <http://www.tapko.de> delivered by <http://www.opternus.com>
* <http://www.sensirion.com> SHT21/SHT25 (temperature + humidity)
* <http://www.taosinc.com> TSL2561 (brightness)
* <http://www.hygrosens.com> miniature motion detector (PIR)
* <http://www.gira.de> smoke detctor modular VDS (smoke detector)
* <http://www.driesen-kern.de> K21 (CO2)


UUID used for iBeacon funtionality: C8A8F392-D8ED-47EA-85FE-0EB1903425AD
