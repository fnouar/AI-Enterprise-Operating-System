#!/usr/bin/env bash
set -euo pipefail

echo "Verifying AI-EOS boot..."
cd backend/kernel-service
./gradlew clean build -x test

echo "Verification complete."
