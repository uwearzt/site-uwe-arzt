+++
title = "Sending Apple Push Notifications with Erlang"
date = 2011-03-04


aliases = [
  "4237d925"
]

[taxonomies]
categories = ["erlang", "ios"]
+++
First of all you have to be sure you have installed Erlang together with SSL. On Mac OS X that can be done with MacPorts:

```bash
sudo port install erlang +ssl
```

## Create Certificate and Key for SSL

First export cert and key as p12 (apns-cert.p12, apns-key.p12) with the "Keychain Access" Tool.

After that you can convert the p12 files to pem files:

```bash
openssl pkcs12 -clcerts -nokeys -out apns-cert.pem -in apns-cert.p12
openssl pkcs12 -nocerts -out apns-tmp-key.pem -in apns-key.p12 -nodes
openssl rsa -in apns-tmp-key.pem -out apns-key.pem
```

<!-- more -->

There ar a lot of other articles around about creating the correct certificates for APNS. For example, see
<http://mobile.tutsplus.com/tutorials/iphone/ios-sdk_push-notifications_part-2/>.

## Create Erlang module

```erlang
%%  Copyright by Uwe Arzt mailto:mail@uwe-arzt.de https://uwe-arzt.de
%%  under GNU Public License v3, see http://www.gnu.org/licenses/gpl.html

-module(pushnotification).
-export([send/1, send/2, send/3]).

% send only a string
send(Msg) ->
  send_pn([{alert, Msg}]).
% send a string and and a bagde number
send(Msg, Badge) ->
  send_pn([{alert, Msg}, {badge, Badge}]).
% send a string, a badge number and play a sound
send(Msg, Badge, Sound) ->
  send_pn([{alert, Msg}, {badge, Badge}, {sound, Sound}]).

send_pn(Msg) ->
  crypto:start(),
  ssl:start(),
  Address = "gateway.sandbox.push.apple.com",
  %Address = "gateway.push.apple.com",
  Port = 2195,
  Cert = "../certificates/apns-cert.pem",
  Key  = "../certificates/apns-key.pem",
  Options = [{certfile, Cert}, {keyfile, Key}, {mode, binary}, {verify, verify_none}],
  Timeout = 10000,
  case ssl:connect(Address, Port, Options, Timeout) of
    {ok, Socket} ->
      PayloadString = create_json(Msg),
      Payload = list_to_binary(PayloadString),
      PayloadLength = size(Payload),
      Packet = <<0:8,
      32:16/big,
      16#0b53b352478d4612c5094f6dca7216c36be97ae48f9a1d22af6399c28caa215f:256/big,
      PayloadLength:16/big,
      Payload/binary>>,
      ssl:send(Socket, Packet),
      ssl:close(Socket),
      PayloadString;
    {error, Reason} ->
      Reason
  end.

% helper for creating json
create_json(List) ->
  lists:append(["{\"aps\":{", create_keyvalue(List), "} }"]).

create_keyvalue([Head]) ->
  create_pair(Head);
create_keyvalue([Head|Tail]) ->
  lists:append([create_pair(Head), ",", create_keyvalue(Tail)]).

create_pair({Key, Value}) ->
  lists:append([add_quotes(atom_to_list(Key)), ":", add_quotes(Value)]).
add_quotes(String) ->
  lists:append(["\"", String, "\""]).]]>
```

## Compile and call

```erlang
1> c(pushnotification.erl).
{ok,pushnotification}
2> pushnotification:send("Message").
"{"aps":{"alert":"Message"} }"
3> pushnotification:send("Message", "10").
"{"aps":{"alert":"Message","badge":"10"} }"
4> pushnotification:send("Message", "10", "chime").
"{"aps":{"alert":"Message","badge":"10","sound":"chime"} }"]]>
```