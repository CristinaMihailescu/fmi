# Configurare Calculator-Switch-Router

1. Plaseaza CALC1:
+ opreste pc, schimba placa de retea cu -1CGE, porneste PC
+ configurezi IP pe CALC1 - ip address, subnet mask, defult gateway
+ EMAIL:
`
Your name: user1
Email Address: user1@fmi.cti.ro
Incoming Mail Server: IP_Server
Outgoing Mail Server: IP_Server
User Name: user1
Password: 123456
`
**SAVE**
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

**INTERFATA**
<pre>
R1(config)# interface GigabitEthernet 0/0 //SW1 G 0/1 ~ R1 G 0/0
R1(config-if)# description Legatura LAN 1
R1(config-if)# ip address 192.168.10.1 255.255.255.0//default gateway CALC1, subnet mask CALC 1
---DACA ROUTERUL CORESPUNDE UNUL SERVER
R1(config-if)# ip helper-address 180.188.55.254 255.255.248.0 //IP Server, subnet mask Server
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

# CONFIGURARE SERVER

1. End devices: plaseaza Generic:
+ opreste Server, schimba placa de retea cu -1CGE, porneste Server
+ configurezi IP pe Server - ip address = ULTIMUL IP DIN RANGE, subnet mask, defult gateway.
+ HTTP: verifica daca HTTP On, HTTPS On
+ DHCP:
`
Interface: On
Pool Name: LAN nume_router
Default Gateway: default_gateway_server
DNS Server: IP_server
Start IP Address: _._._.10
Maximum number of Users: 100
`
**ADD**
+ DNS:
`
DNS Service: On
Name: fmi.cti.ro
Address: IP_server
`
**SET**
+ EMAIL:
`
Domain Name: fmi.cti.ro
`
**Set**
`
User: user1 Password: 123456 Add
User: user2 Password: 123456 Add
...
`
