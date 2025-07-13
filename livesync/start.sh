#!/bin/bash
docker compose down
docker compose up -d
./gen-setup-uri.sh
