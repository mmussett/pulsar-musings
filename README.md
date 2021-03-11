# pulsar-musings
A collection of things relating to Apache Pulsar


## Enabling TLS Authentication

## standalone.conf

```
### To Enable TLS wire encryption #####
tlsEnabled=true
brokerServicePortTls=6651
webServicePortTls=8443
 
# The Broker certificate and associated private key
tlsCertificateFilePath=${HOME}/security/my-ca/broker.cert.pem
tlsKeyFilePath=${HOME}/security/my-ca/broker.key-pk8.pem
 
# The CA certificate
tlsTrustCertsFilePath=${HOME}/security/my-ca/certs/ca.cert.pem
 
# Used for TLS negotiation to specify which ciphers we consider safe.
tlsProtocols=TLSv1.2,TLSv1.1
tlsCiphers=TLS_DH_RSA_WITH_AES_256_GCM_SHA384,TLS_DH_RSA_WITH_AES_256_CBC_SHA

#### To enable TLS authentication 
authenticationEnabled=true
authenticationProviders=org.apache.pulsar.broker.authentication.AuthenticationProviderTls
```

## client.conf

```
#### To Enable TLS wire encryption ##### 
# Use the TLS protocols and ports
webServiceUrl=https://pulsar.gottaeat.com:8443/
brokerServiceUrl=pulsar+ssl://pulsar.gottaeat.com:6651/
 
useTls=true
tlsAllowInsecureConnection=false
tlsEnableHostnameVerification=false
tlsTrustCertsFilePath=${HOME}/security/my-ca/certs/ca.cert.pem
```
