#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER odoo_user WITH PASSWORD 'hdVg4SQB2pEuUFaYLtGzDbn8N7JCk6Zf9sKTAWwjmMPyrevRH3';
	ALTER USER odoo_user CREATEDB;
EOSQL
