#!/bin/bash

# Generate the Server Certificate private key
openssl genrsa -passout pass:pulsar \
      -out ./my-ca/broker.key.pem \
      2048
 
# Convert the key to PEM format
openssl pkcs8 -topk8 -inform PEM -outform PEM \
      -in ./my-ca/broker.key.pem \
      -out ./my-ca/broker.key-pk8.pem \
      -nocrypt
 
# Generate the server certificate request       
openssl req -config ./openssl.cnf \
      -new -sha256 \
      -key ./my-ca/broker.key.pem \
      -out ./my-ca/broker.csr.pem \
      -subj '/C=US/ST=CA/L=Palo Alto/O=IT/CN=broker.pulsar.tibco.com' \
      -passin pass:pulsar
      
# Sign the server certificate with the CA
openssl ca -config ./openssl.cnf \
      -extensions server_cert \
      -days 1000 -notext -md sha256 -batch \
      -in  ./my-ca/broker.csr.pem \
      -out  ./my-ca/broker.cert.pem \
      -passin pass:pulsar

