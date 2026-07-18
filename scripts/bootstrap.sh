#!/usr/bin/env bash
set -euo pipefail

echo "Bootstrapping AI-EOS monorepo..."

if ! command -v pnpm > /dev/null; then
  echo "pnpm is required. Install it first."
  exit 1
fi

pnpm install
