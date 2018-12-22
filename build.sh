#!/bin/bash
set -euxo pipefail

build_deps=(
	curl
	ca-certificates
)

# Ensure /opt directory
mkdir -p /opt

# Create gameserver user
useradd -d /opt/Geneshift gameserver

# Install build deps
apt-get update
apt-get install --no-install-recommends -y "${build_deps[@]}"

# Download linux demo containing the dedicated server
curl -fL "https://www.geneshift.net/downloads/Geneshift${GENESHIFT_VERSION}.tar.gz" | tar -xz -C /opt
chown -R gameserver:gameserver /opt/Geneshift

# Install dumb-init and gosu
curl -sSfLo /usr/bin/dumb-init \
	"https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64"
curl -sSfLo /usr/bin/gosu \
	"https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64"

chmod 0755 \
	/usr/bin/dumb-init \
	/usr/bin/gosu

# Remove build deps and clean up
apt-get remove --purge -y "${build_deps[@]}"
apt-get autoremove --purge -y

# remove synced apt lists
rm -rf /var/lib/apt/lists/*
