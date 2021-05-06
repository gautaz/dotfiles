COMPOSE_HOME="${HOME}/.docker-compose"
COMPOSE_VERSION="$(curl -s "https://api.github.com/repos/docker/compose/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

mkdir -p "${COMPOSE_HOME}/bin"
curl -sL "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o "${COMPOSE_HOME}/bin/docker-compose"
chmod u+x "${COMPOSE_HOME}/bin/docker-compose"

COMPOSE_COMPLETION="docker-compose/.bash_completion.d"
mkdir -p "${COMPOSE_COMPLETION}"
curl -sL "https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose" -o "${COMPOSE_COMPLETION}/docker-compose"
