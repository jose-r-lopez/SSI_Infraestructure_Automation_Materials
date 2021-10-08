$TTL    604800
@       IN      SOA     ns1.ssi.es. root.ssi.es. (
                  3       ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.ssi.es.

; name servers - A records
ns1.ssi.es.          		IN      A      172.136.0.2

web1.ssi.es.			IN      A      172.136.0.3
web2.ssi.es.		        IN      A      172.136.0.4
web3.ssi.es.		        IN      A      172.136.0.5
kali.ssi.es.		        IN      A      172.136.0.6
