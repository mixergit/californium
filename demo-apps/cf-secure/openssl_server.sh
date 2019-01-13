#! /bin/sh

echo "start openssl dtls server"

export CIPHERS_ECDSA=ECDHE-ECDSA-AES128-CCM8:ECDHE-ECDSA-AES128-SHA256:ECDHE-ECDSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA384
export CIPHERS_PSK=PSK-AES128-CCM8:ECDHE-PSK-AES128-CBC-SHA256:PSK-AES128-CBC-SHA256
export PSK=736573616d65

echo "ciphers ecdsa:" ${CIPHERS_ECDSA}
echo "ciphers psk  :" ${CIPHERS_PSK}

openssl s_server -dtls1_2 -port 5684 -listen -no-CAfile -cipher ${CIPHERS_ECDSA}:${CIPHERS_PSK} -psk ${PSK}
