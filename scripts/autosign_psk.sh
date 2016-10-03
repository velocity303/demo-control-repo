#! /bin/bash

PSK_DIR=/etc/puppetlabs/puppet/autosign/psk

csr=$(< /dev/stdin)
certname=$1

# Get the certificate extension with OID $1 from the csr
function extension {
  echo "$csr" | openssl req -noout -text | fgrep -A1 "$1" | tail -n 1 \
      | sed -e 's/^ *//;s/ *$//'
}

psk=$(extension '1.3.6.1.4.1.34380.1.1.4')

echo "autosign $1 with PSK $psk"

psk_file=$PSK_DIR/psk
if [ -f "$psk_file" ]; then
    if grep -q "$psk" "$psk_file"; then
        exit 0
    else
        echo "File for '$psk' does not match"
        exit 1
    fi
else
    echo "Could not find PSK file"
    exit 1
fi

