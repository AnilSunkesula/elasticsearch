IP=$1
curl -X PUT "${IP}:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "primaries"
  }
}
'

curl -X POST "${IP}:9200/_flush/synced?pretty"

curl -X POST "${IP}:9200/_ml/set_upgrade_mode?enabled=true&pretty"

sudo systemctl stop elasticsearch.service

curl -X GET "${IP}:9200/_cat/nodes?pretty"

curl -X PUT "${IP}:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
'

curl -X POST "${IP}:9200/_ml/set_upgrade_mode?enabled=false&pretty"
