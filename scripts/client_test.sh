#!/bin/sh

set -eu

ID="${KEYCLOAK_CLIENT_ID}"
SECRET="${KEYCLOAK_CLIENT_SECRET}"
URL="${KEYCLOAK_URL}"

# token endpoint is where you get access tokens
URL="${KEYCLOAK_URL}/auth/realms/${KEYCLOAK_REALM}/protocol/openid-connect/token"

TOKEN=$(curl -s -X POST \
  -H "Content-type: application/x-www-form-urlencoded" \
  -d client_id="${ID}" \
  -d client_secret="${SECRET}" \
  -d grant_type=client_credentials \
  "${URL}" | jq -r .access_token 2>/dev/null)

if [ -n "${TOKEN}" ]; then
    echo "SUCCESS!"
fi
