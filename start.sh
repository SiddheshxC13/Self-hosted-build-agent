#!/bin/bash

echo "Starting the self-hosted build agent setup..."
export PATH="$HOME/.tfenv/bin:$HOME/.tgenv/bin:$PATH"
echo "Terraform versions installed:"
tfenv list

echo "Terragrunt versions installed:"
tgenv list
echo "Python versions installed:"
python3.8 --version
python3.10 --version

echo "kubectl version:"
kubectl version --client --short

echo "Syft version:"
syft version

echo "Grype version:"
grype version

echo "Agent setup completed. Keeping the container running..."
tail -f /dev/null
