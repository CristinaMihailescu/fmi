Tutorial configurare Calculator-Switch-Router

1. Plaseaza CALC1: opreste pc, schimba placa de retea cu -1CGE, porneste PC, configurezi IP pe CALC1 - ip address, subnet mask, defult gateway

2. Plaseaza SW1 (Switch 2960): conecteaza cu CALC1 - copper straight through (CALC1 G 0 ~ SW1 G 0/1)

3. Plaseaza Laptop: conecteaza cu SW1 - console (Laptop RS 232 ~ SW1 Console)

3. Configureaza SW1 (in terminal - Laptop):
``markdown
//INCEPUT
Switch> enable //mod user => mod privileged
Switch# configure terminal
Switch(config)# no ip domain-lookup //cand introduci ceva gresit, sa nu astepti degeaba
Switch(config)# hostname SW1 //SW1 = nume switch de care e legat

//PAROLE
SW1(config)# service password-encryption
SW1(config)# enable secret cisco12345 //pentru enable
SW1(config)# enable password cisco54321

SW1(config)# banner motd #Text#

//CONFIGURARE ACCES CONSOLA
SW1(config)# line console 0
SW1(config-line)# password ciscoconpass //pentru consola
SW1(config-line)# login //ca sa ceara pass
SW1(config-line)# logging synchronous //sa te intoarca unde ai ramas daca vin mesaje de la OS
SW1(config-line)# exec-timeout 15 0 //te da afara dupa 15 minute si 0 secunde
SW1(config-line)# exit

//CONFIGURARE ACCES TELNET
SW1(config)# line vty 0 15
SW1(config-line)# password ciscovtypass
SW1(config-line)# login
SW1(config-line)# logging synchronous
SW1(config-line)# exec-timeout 15 0
SW1(config-line)# exit

//INTERFATA
SW1(config)# interface range FastEthernet 0/1-24
SW1(config-if-range)# **shutdown**
SW1(config-if-range)# exit
SW1(config)# exit

//SAVE
SW1# copy running-config startup-config
SW1# exit

//VERIFICARE SECURITATE
SW1# enable
SW1# show running-config
``

4. Plaseaza R1 (Router 2911): conecteaza cu SW1 - copper straight through(SW1 G 0/1 ~ R1 G 0/2), conecteaza cu Laptop - console (Laptop RS 232 ~ R1 Console)

5. Configureaza R1 (in terminal - Laptop):

``markdown
no
//INCEPUT ..
//PAROLE
R1(config)# service password-encryption
R1(config)# **security passwords min-length 10**
R1(config)# **login block-for 20 attempts 2 within 30** //blocheaza timp de 20 de secunde la doua incercari gresite in interval de 30 de secunde
R1(config)# enable secret cisco12345
R1(config)# enable password cisco54321

R1(config)# **banner login #Text#**
R1(config)# banner motd #Text#

//CONFIGURARE ACCES CONSOLA ..
//CONFIGURARE ACCES TELNET ..

//INTERFATA
R1(config)# interface GigabitEthernet 0/0 //SW1 G 0/1 ~ R1 G 0/0
R1(config-if)# description Legatura LAN 1
R1(config-if)# ip address 192.168.10.1 255.255.255.0//default gateway CALC1, subnet mask CALC 1
R1(config-if)# **no shutdown**
R1(config-if)# exit

//SAVE ..

//TEST CONECTIVITATE
R1# ping 192.168.10.10

//CONECTARE REMOTE
R1# telnet 192.168.10.1 //ciscovtypass
R1# enable //cisco123545
``

SCURTATURI
en ~ enable
conf t ~ configure terminal
int ~ interface
ip add ~ ip address
no shut ~ no shutdown