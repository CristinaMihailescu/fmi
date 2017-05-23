# Configurare Calculator-Switch-Router

1. Plaseaza CALC1:
+ opreste pc, schimba placa de retea cu -1CGE, porneste PC
+ configurezi IP pe CALC1 - ip address, subnet mask, defult gateway
+ EMAIL:
<pre>
Your name: user1
Email Address: user1@fmi.cti.ro
Incoming Mail Server: IP_Server
Outgoing Mail Server: IP_Server
User Name: user1
Password: 123456

SAVE
</pre>

2. Plaseaza SW1 (Switch 2960): conecteaza cu CALC1 - copper straight through (CALC1 G 0 ~ SW1 G 0/2)

3. Plaseaza Laptop: conecteaza cu SW1 - console (Laptop RS 232 ~ SW1 Console)

3. Configureaza SW1 (in terminal - Laptop):

**INCEPUT**

<pre>
Switch> enable //mod user => markdown mod privileged
Switch# configure terminal
Switch(config)# no ip domain-lookup //cand introduci ceva sa nu astepti degeaba
Switch(config)# hostname SW1 //SW1 = nume switch de care e legat
</pre>
**PAROLE**
<pre>
SW1(config)# service password-encryption
SW1(config)# enable secret cisco12345 //pentru enable
SW1(config)# enable password cisco54321

SW1(config)# banner motd #Text#
</pre>
**CONFIGURARE ACCES CONSOLA**
<pre>
SW1(config)# line console 0
SW1(config-line)# password ciscoconpass //pentru consola
SW1(config-line)# login //ca sa ceara pass
SW1(config-line)# logging synchronous //sa te intoarca unde ai ramas daca vin mesaje de la OS
SW1(config-line)# exec-timeout 15 0 //te da afara dupa 15 minute si 0 secunde
SW1(config-line)# exit
</pre>
**CONFIGURARE ACCES TELNET**
<pre>
SW1(config)# line vty 0 15
SW1(config-line)# password ciscovtypass
SW1(config-line)# login
SW1(config-line)# logging synchronous
SW1(config-line)# exec-timeout 15 0
SW1(config-line)# exit
</pre>
**NO CDP RUN**
<pre>
SW1(config)# no cdp run
</pre>
**INTERFATA**
<pre>
SW1(config)# interface range FastEthernet 0/1-24
<b>SW1(config-if-range)# shutdown</b>
SW1(config-if-range)# exit
SW1(config)# exit
</pre>
**SAVE**
<pre>
SW1# copy running-config startup-config
SW1# exit
</pre>
**VERIFICARE SECURITATE**
<pre>
SW1# enable
SW1# show running-config
</pre>

4. Plaseaza R1 (Router 2911): Schimba <i>physical device view</i> la ambele routere: opreste, scoate toate modulele, adauga HWIC-2T pe ultima pozitie, porneste; conecteaza cu SW1 - copper straight through(SW1 G 0/1 ~ R1 G 0/0), conecteaza cu Laptop - console (Laptop RS 232 ~ R1 Console)

5. Configureaza R1 (in terminal - Laptop):

<pre>
no
</pre>
**INCEPUT ..**

**PAROLE**
<pre>
R1(config)# service password-encryption
<b>R1(config)# security passwords min-length 10</b>
<b>R1(config)# login block-for 20 attempts 2 within 30</b> //blocheaza timp de 20 de secunde la doua incercari gresite
                                                           //in interval de 30 de secunde
R1(config)# enable secret cisco12345
R1(config)# enable password cisco54321

<b>R1(config)# banner login #Text#</b>
R1(config)# banner motd #Text#
</pre>
**CONFIGURARE ACCES CONSOLA ..**

**CONFIGURARE ACCES TELNET ..**

**NO CDP RUN ..**

**INTERFATA**
<pre>
R1(config)# interface GigabitEthernet 0/0 //SW1 G 0/1 ~ R1 G 0/0
R1(config-if)# description Legatura LAN 1
R1(config-if)# ip address 192.168.10.1 255.255.255.0//default gateway CALC1, subnet mask CALC 1
---PENTRU ROUTERELE DE PE LAN-URILE PE CARE VREI DHCP
R1(config-if)# ip helper-address 180.188.55.254//IP Server
---
<b>R1(config-if)# no shutdown</b>
R1(config-if)# exit
</pre>

**CONFIGURARE LEGATURA CU ALT ROUTER**
<pre>
R1(config)# interface S 0/0/0
R1(config-if)# description Legatura CHINA-SUA
R1(config-if)# ip address 10.10.10.50 255.255.255.252 //ip legatura cu celalalt router
R1(config-if)# no shutdown
R1(config-if)# exit
R1(config)# exit
R1# copy running-config startup-config
</pre>

**CONFIGURARE LEGATURA CU COPII ROUTERULUI CU CARE AM FACUT LEGATURA**

<pre>
R1(config)# ip route NA_CALC_LEGAT_DE_R2 SM_CALC_LEGAT_DE_R2 Serial
ex: R1(config)# ip route 173.16.152.0 255.255.254.0 Serial 0/0/0
</pre>

**CONFIGURARE LEGATURA CU O ALTA RETEA DE 2 ROUTERE**

<pre>
R1(config)# ip route NA_ROUTERS SM_ROUTERS Serial
ex: R1(config)# ip route 173.16.152.0 255.255.254.0 Serial 0/0/0
</pre>

**SAVE ..**

**TEST CONECTIVITATE**
<pre>
R1# ping IP_C
R1# telnet DG_C
</pre>

**SCURTATURI**
<pre>
en ~ enable
conf t ~ configure terminal
int ~ interface
ip add ~ ip address
no shut ~ no shutdown
</pre>

# Configurare Server

1. End devices: plaseaza Generic:
+ opreste Server, schimba placa de retea cu -1CGE, porneste Server
+ configurezi IP pe Server - ip address = ULTIMUL IP DIN RANGE, subnet mask, defult gateway
+ HTTP:
<pre>
HTTP: Off
</pre>
+ DHCP:
Pentru fiecare LAN pe care vrei DHCP:
<pre>
Interface: On
Pool Name: NUME_LAN (ex: LAN CECENIA1)
Default Gateway: default_gateway_C1
DNS Server: IP_server
Start IP Address: default_gateway_C1 + 10 ip-uri
Subnet Mask: subnet_mask_C1
Maximum number of Users: cati sunt in cerinta asociati lanului CECENIA1

ADD
</pre>

+ DNS:
<pre>
DNS Service: On
Name: fmi.cti.ro
Address: IP_server

SET
</pre>

+ EMAIL:
<pre>
Domain Name: fmi.cti.ro

SET

User: user1 Password: 123456 Add
User: user2 Password: 123456 Add
...
</pre>

2. Pentru fiecare calculator schimba de pe ip static pe dhcp la ip configuration.

# Configurare Wi-Fi

1. Asigura-te ca la GigabitEthernet 0/x (leg cu Wi-Fi) ai cel mai mic ip dintre cele doua.

2. Plaseaza Wireless Devices -> WRT300N:

+ GUI
<pre>
Internet Connection Type: Static IP
Internet IP Address: ip mai mare
Subnet Mask: 255.255.255.252
Default Gateway: ip mai mic

SAVE
</pre>

+ Wireless -> Basic Wireless Settings
<pre>
Network Name (SSID): Seria24

SAVE
</pre>

+ Wireless -> Wireless Security
<pre>
Security Mode: WPA2 Personal
Encryption: TKIP
Passphrase: Grupa243

SAVE
</pre>

+ Wireless -> Wireless MAC Filter
<pre>
Wireless MAC Filter: Enable
Access Resolution: selecteaza a 2-a bulina

SAVE
</pre>

3. Plaseaza PC:

+ Schimba placa cu Linksys-WMP300N module (cea mare de jos, din dreapta)

+ Desktop -> PC Wireless -> Profiles -> Edit -> Advanced Setup -> Wireless Network Name: Seria 24; next -> next -> Security: WPA2 Personal -> Pre-shared Key: Grupa243 -> SAVE.

+ Desktop -> Command Prompt -> ipconfig /all -> Copy la Physical Address.

+ Wi-Fi -> Wireless MAC Filter -> MAC 01: Paste aici; din 2 in 2 cifre pune ":".

+ PC -> Desktop -> PC Wireless -> Selecteaza conexiunea -> Edit -> Connect.
