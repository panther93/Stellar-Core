start_stellar_core() {
    /usr/local/bin/stellar-core --conf=/opt/stellar/core/etc/stellar-core.cfg
}

if [ -f /opt/stellar/core/.core-initialized ]
    then
    echo "core: already initialized"
    start_stellar_core
    return 0
fi
/usr/local/bin/stellar-core --newdb --conf=/opt/stellar/core/etc/stellar-core.cfg
touch .core-initialized
start_stellar_core
