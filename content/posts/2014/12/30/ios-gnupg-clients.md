---
title: iOS GnuPG Clients
categories:
  - OS
  - iOS
  - Security
published_date: "2014-12-30 00:00:00 +0100"
layout: post.liquid
data:
  shortlink: 4297d152
  type: blog
---
On my Mac i already use GnuPG a lot (basically all my messages are signed, and some of them
encrypted). But because nowadays i do a good amount of work on my iPad an iPhone, is had to
search for a GnuPG solution on iOS too.

<!-- more -->

# Clients

<table>
	<thead>
		<tr><th></th><th>Name</th><th>Price</th></tr>
	</thead>
	<tbody>
		<tr>
			<td><img src="ipgmail_icon.png" alt="iPGMail Icon" /></td>
			<td><a href="https://itunes.apple.com/de/app/ipgmail/id430780873?mt=8">iPGMail</a></td>
			<td>1,79 EUR</td>
		</tr>
		<tr>
			<td><img src="opengp_icon.png" alt="oPenGP Icon" /></td>
			<td><a href="https://itunes.apple.com/de/app/opengp/id414003727?mt=8">oPenGP</a></td>
			<td>4,49 EUR</td>
		</tr>
		<tr>
			<td><img src="secumail_icon.jpg" alt="Secumail Icon" /></td>
			<td><a href="https://itunes.apple.com/de/app/secumail/id414328661?mt=8">Secumail</a></td>
			<td>44,99 EUR</td>
		</tr>
		<tr>
			<td><img src="nouveaupg_icon.png" alt="NouveauPG Icon" /></td>
			<td><s>NouveauPG</s> (not available in german iTunes Store)</td>
			<td>2,69 EUR</td>
		</tr>
	</tbody>
</table>

All programs where tested on iOS 8.1.2 with a iPhone 6 and a iPad Mini Retina. All programs
except NouveauPG are Universal Apps and optimized fordifferent screen sizes.

# Test Matrix

the programs where tested against this test matrix. I started at the top and proceeded
to the bottom. Secumail and NouveauPG are disqualified, because it is not possible to
exchange the private Key over iTunes, and you should never copy your private key to
a Cloud Storage (even with a good passphrase).

For the remaining programs i have tested if the functionality works, and then got my own
opinion if the integration in iOS is felicitous.

<table>
	<thead>
		<tr><th></th><th>iPGMail</th><th>oPenGP</th><th>Secumail</th><th>NouveauPG</th></tr>
	</thead>
	<tbody>
		<tr>
			<td><strong>Keyhandling</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Generate Key pair</td>
			<td>yes</td>
			<td>no</td>
			<td>no</td>
			<td>yes</td>
		</tr>
		<tr>
			<td>Private Key transfer</td>
			<td>iTunes, Dropbox, iCloud, Clipboard</td>
			<td>iTunes, Dropbox, Clipboard</td>
			<td>Dropbox, Clipboard</td>
			<td>Clipboard</td>
		</tr>
		<tr>
			<td>Public Key transfer</td>
			<td>same as private + Keyserver</td>
			<td>same as private + Keyserver</td>
			<td>same as private + Keyserver</td>
			<td>same as private</td>
		</tr>
		<tr>
			<td>Upload new public key to Keyserver</td>
			<td>yes</td>
			<td>no</td>
			<td>no</td>
			<td>no</td>
		</tr>
		<tr>
			<td>Own Keyserver possible</td>
			<td>yes</td>
			<td>yes</td>
			<td>yes (no preset)</td>
			<td>no</td>
		</tr>
		<tr>
			<td>Needs access to contacts</td>
			<td>no</td>
			<td>yes (searches for keys of contact EMail only)</td>
			<td>no</td>
			<td>no</td>
		</tr>
		<tr>
			<td>Save passphrases</td>
			<td>no</td>
			<td>Keychain</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td><strong>Decryption</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Integration in Mail</td>
			<td>Share, good</td>
			<td>Share, good</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td><strong> Signing</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Single receiver</td>
			<td>ok, good</td>
			<td>ok, bad</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Multiple receivers</td>
			<td>ok, good</td>
			<td>ok, bad</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td><strong>Encryption</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Single receiver</td>
			<td>ok, good</td>
			<td>ok, bad</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Multiple receivers</td>
			<td>ok, good</td>
			<td>ok, bad</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td><strong>Attachments</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Receiving</td>
			<td>ok</td>
			<td>ok</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Sending</td>
			<td>ok</td>
			<td>ok</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td><strong>Compatibility</strong></td><td></td><td></td><td></td><td></td>
		</tr>
		<tr>
			<td>Apple Mail</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Outlook (Windows)</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Thunderbird + Enigmail</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>Android</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>inline PGP</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
		<tr>
			<td>PGP/Mime</td>
			<td>yes</td>
			<td>yes</td>
			<td>---</td>
			<td>---</td>
		</tr>
	</tbody>
</table>

# Conclusions

The usage of GnuPG on the iPhone is not as usable as on other devices. It works with some
hassle, but for a widespread use of GnuPG on iOS, Apple has to allow plugins in the
iOS Mail program.

In my opinion, the cheapest App (iPGMail) is the way to go.

# Recommendations

- Always use iTunes for Key transfer (not Dropbox or iCloud)
- Do not generate your key pair on the iPhone (unknown RNG)

# How to use iPGMail

## Copy your private Key

![Export Keys](export_01.png)

Find the key to export to the iPhone.

![Export Keys](export_02.png)

Select Export (Exportieren in german language).

![Export Keys](export_03.png)

Do not forget to export your private key too (Geheimer Schlüssel in german language).

![Import Keys](import_01.png)

In the Apps Section you have to completely scroll down until you see the section where you can copy
files to the iPhone/iPad. There you have to select iPGMail and click add (Hinzuf&uuml;gen in
german Language).

![Import Keys](import_02.png)

Select your exported keys and click add.

![Import Keys](import_03.png)

Start a sync which will copy the Key over to the iOS Device.

![Import Keys](import_04.png)

In iPGMail select the files Tab and tap on your Key file.

![Import Keys](import_05.png)

You have to provide your password (hopefully a good one).

![Import Keys](import_06.png)

If everything worked, the keys are imported.

![Import Keys](import_07.png)

Check if your private keys was imorted too.

## Getting a public key

![Getting Keys from Keyserver](pubkey_01.png)

Search them on the keyserver (there are already keyservers predefined, but you can use your
own too, i.e. for company environments).

![Getting Keys from Keyserver](pubkey_02.png)

Tap on the key to download.

## Sending a signed and encryted EMail

![Send encrypted EMail](send_01.png)

Start iPGMail and go to the compose tab. You can select a key which is used for signing
(your own key) and a public key for encryption (the public receiver key). Then you can type
your subject and your message. After that, click on the send icon in the upper right corner.

![Send encrypted EMail](send_02.png)

Select "Send EMail" for creating a EMail directly.

![Send encrypted EMail](send_03.png)

The receiver is picked up from the public key you haven chosen before. **Send**.

## Reading an encrypted EMail

![Receive encrypted EMail](receive_01.png)

In a received EMail you have a encrypted Attachment.
Tap on the Attachment and you have the encrypted text.

![Receive encrypted EMail](receive_02.png)

Tap on the Share Button in the upper right corner.

![Receive encrypted EMail](receive_03.png)

And choose iPGMail.

![Receive encrypted EMail](receive_04.png)

Provide the password for your key.

![Receive encrypted EMail](receive_05.png)

And you get a list of all decrypted parts (text, attachments).

![Receive encrypted EMail](receive_06.png)

Tap on the text, and here we are.
