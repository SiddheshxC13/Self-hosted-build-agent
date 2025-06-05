#!/bin/bash
set -e

if [ -z "$AZP_URL" ] || [ -z "$AZP_TOKEN" ] || [ -z "$AZP_POOL" ]; then
  echo "Missing required environment variables."
  exit 1
fi

export AGENT_ALLOW_RUNASROOT="1"
./bin/Agent.Listener configure --unattended \
  --url "$AZP_URL" \
  --auth pat \
  --token "$AZP_TOKEN" \
  --pool "$AZP_POOL" \
  --agent "${AZP_AGENT_NAME:-$(hostname)}" \
  --replace

./bin/Agent.Listener run
