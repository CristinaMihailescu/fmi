# Configurare Router-Router

1. Schimba <i>physical device view</i> la ambele routere: opreste, scoate toate modulele, adauga HWIC-2T pe ultima pozitie, porneste
2. Configureaza legatura dintre routere (idem R2):
<pre>
R1> enable
R1# configure terminal
R1(config)# interface S0/0/0
R1(config-if)# description Legatura CHINA-SUA
R1(config-if)# ip address 10.10.10.50 255.255.255.252 //asignez un ip router-ului
R1(config-if)# no shutdown
R1(config-if)# exit
R1(config)# exit
R1# copy running-config startup-config
</pre>
2. Conecteaza R1 cu R2 - Serial DTE (R1 Serial 0/0/0 ~ R2 Serial 0/0/0)
3. Pentru R1 (idem R2):
<pre>
R1(config)# ip route NA_CALC_LEGAT_DE_R2 SM_CALC_LEGAT_DE_R2 interfata_pe_unde_sa_mergi | ip_next_hop
R1(config)# ip route 173.16.152.0 255.255.254.0 Serial 0/0/0
</pre>

Verificare legaturi R1 (trebuie sa apara toate NA ~ CALC 1, CALC 2 (legate de R1), CALC 3, CALC 4 (legate de R2), R2):
<pre>
Mod privilegiat: `show ip route`
Mod config: `do show ip route`
ping 10.10.10.49 //ip-ul celuilalt router
</pre>
