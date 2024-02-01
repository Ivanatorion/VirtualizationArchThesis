#!/bin/bash

openssl genrsa -passout pass:virt -des3 -out VirtP4.key 4096
openssl req -passin pass:virt -new -x509 -days 365 -key VirtP4.key -out VirtP4.crt -subj "/C=BR/ST=Rio Grande do Sul/L=Porto Alegre/O=UFRGS/OU=INF/CN=root" 

openssl genrsa -passout pass:virt -des3 -out server.key 4096
openssl req -passin pass:virt -new -key server.key -out server.csr -subj "/C=BR/ST=Rio Grande do Sul/L=Porto Alegre/O=UFRGS/OU=INF/CN=localhost"
openssl x509 -req -passin pass:virt -days 365 -in server.csr -CA VirtP4.crt -CAkey VirtP4.key -set_serial 01 -out server.crt

openssl rsa -passin pass:virt -in server.key -out server.key

openssl genrsa -passout pass:virt -des3 -out client1.key 4096
openssl req -passin pass:virt -new -key client1.key -out client1.csr -subj  "/C=BR/ST=Rio Grande do Sul/L=Porto Alegre/O=UFRGS/OU=INF/CN=Client1"
openssl x509 -passin pass:virt -req -days 365 -in client1.csr -CA VirtP4.crt -CAkey VirtP4.key -set_serial 01 -out client1.crt

openssl rsa -passin pass:virt -in client1.key -out client1.key

openssl genrsa -passout pass:virt -des3 -out client2.key 4096
openssl req -passin pass:virt -new -key client2.key -out client2.csr -subj  "/C=BR/ST=Rio Grande do Sul/L=Porto Alegre/O=UFRGS/OU=INF/CN=Client2"
openssl x509 -passin pass:virt -req -days 365 -in client2.csr -CA VirtP4.crt -CAkey VirtP4.key -set_serial 01 -out client2.crt

openssl rsa -passin pass:virt -in client2.key -out client2.key

openssl genrsa -passout pass:virt -des3 -out client3.key 4096
openssl req -passin pass:virt -new -key client3.key -out client3.csr -subj  "/C=BR/ST=Rio Grande do Sul/L=Porto Alegre/O=UFRGS/OU=INF/CN=Client3"
openssl x509 -passin pass:virt -req -days 365 -in client3.csr -CA VirtP4.crt -CAkey VirtP4.key -set_serial 01 -out client3.crt

openssl rsa -passin pass:virt -in client3.key -out client3.key

rm *.csr
mv client1.crt Client1/client.crt
mv client2.crt Client2/client.crt
mv client3.crt Client3/client.crt
mv client1.key Client1/client.key
mv client2.key Client2/client.key
mv client3.key Client3/client.key
