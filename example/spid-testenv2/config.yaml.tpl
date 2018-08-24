---
# CONFIGURAZIONE IDENTITY PROVIDER

# URL da usare per generare l'entityID dell'IdP e gli URL degli endpoint
# SAML indicati nel metadata dell'IdP
base_url: "${IDP_SCHEMA}://${IDP_FQDN}:${IDP_PORT}"

# Chiave e certificato necessari per la firma dei messaggi SAML
key_file: "./conf/idp.key"
cert_file: "./conf/idp.crt"


# CONFIGURAZIONE SERVICE PROVIDER

# Si possono configurare più Service Provider. Per leggere i metadati da un 
# file .xml è sufficiente inserirne il path sotto "local"; per leggerli da 
# un URL remoto bisogna invece inserirlo sotto "remote" (insieme al path di
# una copia locale del certificato del Service Provider, che per sicurezza 
# deve coincidere con quello presente nei metadati).
# cfr. https://pysaml2.readthedocs.io/en/latest/howto/config.html#metadata
metadata:
  local:
  - "./conf/sp_metadata.xml"
#  remote:
#  - url: "http://spid-sp/metadata
#    cert: "./conf/spid-sp.cert"


# CONFIGURAZIONE TESTENV WEB SERVER

# Abilita (true) o disabilita (false) la modalità debug
debug: true

# Indirizzo IP dell'interfaccia su cui esporre il server e porta
# (0.0.0.0 per ascoltare su tutte le interfacce)
host: 0.0.0.0
port: ${IDP_PORT}

# Abilita (true) o disabilita (false) la modalità HTTPS per l'IdP
https: false

# Se si abilita HTTPS è necessario specificare chiave e certificato
# (indipendenti da chiave e certificato SAML)
#https_key_file: "path/to/key"
#https_cert_file: "path/to/cert"

# Endpoint del server IdP (path relativi)
endpoints:
  single_sign_on_service: "/sso"
  single_logout_service: "/slo"
