.PHONY: config
config:
# 	 rm -rf clickhouse_cluster/clickhouse01 clickhouse_cluster/clickhouse02 clickhouse_cluster/clickhouse03 clickhouse_cluster/clickhouse04
	 mkdir -p clickhouse_cluster/clickhouse01 clickhouse_cluster/clickhouse02 clickhouse_cluster/clickhouse03 clickhouse_cluster/clickhouse04
	 REPLICA=01 SHARD=01 envsubst < clickhouse_cluster/config.xml > clickhouse_cluster/clickhouse01/config.xml
	 REPLICA=02 SHARD=01 envsubst < clickhouse_cluster/config.xml > clickhouse_cluster/clickhouse02/config.xml
	 REPLICA=03 SHARD=02 envsubst < clickhouse_cluster/config.xml > clickhouse_cluster/clickhouse03/config.xml
	 REPLICA=04 SHARD=02 envsubst < clickhouse_cluster/config.xml > clickhouse_cluster/clickhouse04/config.xml
	 cp clickhouse_cluster/users.xml clickhouse_cluster/clickhouse01/users.xml
	 cp clickhouse_cluster/users.xml clickhouse_cluster/clickhouse02/users.xml
	 cp clickhouse_cluster/users.xml clickhouse_cluster/clickhouse03/users.xml
	 cp clickhouse_cluster/users.xml clickhouse_cluster/clickhouse04/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: stop
stop:
	docker-compose stop

.PHONY: down
down:
	docker-compose down
