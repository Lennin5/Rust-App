# !/usr/bin/env bash
source '.env'
HASURA_ENDPOINT="http://localhost:8079/v1/graphql"

HASURA_GRAPHQL_ADMIN_SECRET=rust-app-access-key

gq ${HASURA_ENDPOINT} -H "X-Hasura-Admin-Secret: ${HASURA_GRAPHQL_ADMIN_SECRET}" --introspect > schema.graphql
