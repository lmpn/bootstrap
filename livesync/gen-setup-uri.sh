if [[ -z "$hostname" ]]; then
  export hostname=https://192.168.1.152:5984 #Point to your vault
  echo "INFO: using ${hostname}"
fi
export database=obsidiannotes      #Please change as you like
export passphrase=obsidianpassword #Please change as you like
export username=couch-admin
export password=couch-password
deno run -A generate_setupuri.ts
