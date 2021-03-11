#!/bin/bash

mkdir ./my-ca


mkdir ./my-ca/certs ./my-ca/crl ./my-ca/newcerts ./my-ca/private
chmod 700 ./my-ca/private/
touch ./my-ca/index.txt ./my-ca/index.txt.attr
echo 1000 > ./my-ca/serial
 
# Generate the certificate authority private key
openssl genrsa -aes256 \
   -passout pass:pulsar \
   -out ./my-ca/private/ca.key.pem \
   4096
 
# Restrict Acess to the certificate authority private key   
chmod 400 ./my-ca/private/ca.key.pem
 
# Create the X.509 certificate.
openssl req -config ./openssl.cnf \
  -key ./my-ca/private/ca.key.pem \
  -new -x509 \
  -days 7300 \
  -sha256 \
  -extensions v3_ca \
  -out ./my-ca/certs/ca.cert.pem \
  -subj '/C=US/ST=CA/L=Palo Alto/O=IT/CN=tibco.com' \
  -passin pass:pulsar

