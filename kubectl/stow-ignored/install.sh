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
. kubectl/.bashrc.d/kubectl
if hash -r kubectl 2>/dev/null; then
	KUBECTL_COMPLETION="kubectl/.bash_completion.d"
	mkdir -p "${KUBECTL_COMPLETION}"
	kubectl completion bash > "${KUBECTL_COMPLETION}/kubectl"
fi
