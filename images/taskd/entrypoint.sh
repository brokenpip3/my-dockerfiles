#!/bin/sh
set -e
PKI=$TASKDDATA"/pki"

if [ ! -d "$PKI" ]; then
  mkdir -p "$PKI"
  cp /usr/share/taskd/pki/generate* "$PKI"
  cp /usr/share/taskd/pki/vars "$PKI"
  taskd init > /dev/null 2>&1
fi

# Generate self sign certificate if none exists
# Also generate user certificate if env vars: USER/USER_ORG
if [ ! -f "$PKI/ca.cert.pem" ]; then
    cd "$PKI"

    [ -n "$CERT_CN" ] && sed -i "s/\(CN=\).*/\1'$CERT_CN'/" vars
    [ -n "$CERT_ORGANIZATION" ] && sed -i "s/\(ORGANIZATION=\).*/\1'$CERT_ORGANIZATION'/" vars
    [ -n "$CERT_COUNTRY" ] && sed -i "s/\(COUNTRY=\).*/\1'$CERT_COUNTRY'/" vars
    [ -n "$CERT_STATE" ] && sed -i "s/\(STATE=\).*/\1'$CERT_STATE'/" vars
    [ -n "$CERT_LOCALITY" ] && sed -i "s/\(LOCALITY=\).*/\1'$CERT_LOCALITY'/" vars

    ./generate > /dev/null 2>&1
    taskd config --force client.cert "$PKI/client.cert.pem"
    taskd config --force client.key "$PKI/client.key.pem"
    taskd config --force server.cert "$PKI/server.cert.pem"
    taskd config --force server.key "$PKI/server.key.pem"
    taskd config --force server.crl "$PKI/server.crl.pem"
    taskd config --force ca.cert "$PKI/ca.cert.pem"
    #taskd config --force log "$TASKDDATA/taskd.log"
    taskd config --force pid.file "$TASKDDATA/taskd.pid"
    taskd config --force server 0.0.0.0:53589
    [ -n "$USER_ORG" ] && taskd add org "$USER_ORG"
    if [ -n "$USER" ]; then
        taskd add user "$USER_ORG" "$USER"
        ./generate.client "$USER" > /dev/null 2>&1
        printf "\nCertificate for %s/%s \n" "$USER" "$USER_ORG"
        cat "$USER.cert.pem"
        printf "\nKey for %s/%s \n" "$USER" "$USER_ORG"
        cat "$USER.key.pem"
        printf "\nCA\n"
        cat ca.cert.pem
    fi
    chown -R taskd:taskd "$TASKDDATA"
else
    printf "Certificates already generated, starting taskd"
fi

exec "$@"
