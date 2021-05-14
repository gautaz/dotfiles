#!/usr/bin/env bash
mkdir -p "${HOME}/.kube/config.d"
if [ ! -e "${HOME}/.kube/config" ]; then
	cat > "${HOME}/.kube/config" <<- EOC
	apiVersion: v1
	clusters: null
	contexts: null
	kind: Config
	preferences: {}
	users: null
	EOC
fi
