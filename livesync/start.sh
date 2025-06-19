# Prepare environment variables.
export hostname=localhost:5984
export username=couch-admin
export password=couch-password

# Prepare directories which save data and configurations.
mkdir couchdb-data
mkdir couchdb-etc
docker compose up -d

./server-init.sh
