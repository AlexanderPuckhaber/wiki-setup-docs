This script uses hardcoded paths for the temporary backup file

It also relies on database and S3 credentials being available in environment

run_mybackup.sh appears to initialize these env vars, and then executes mybackup.sh.

it does not appear that these environment variables are accesible in regular terminal afterwards, so its hopefully ok

might be a good idea to reduce file read permissons for the env var file, to just root

It requires aws s3 cli tools being installed