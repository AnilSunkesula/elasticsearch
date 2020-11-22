curl -X PUT "10.160.89.17:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "primaries"
  }
}
'

curl -X POST "10.160.89.17:9200/_flush/synced?pretty"

curl -X POST "10.160.89.17:9200/_ml/set_upgrade_mode?enabled=true&pretty"

sudo systemctl stop elasticsearch.service

curl -X GET "10.160.89.17:9200/_cat/nodes?pretty"

curl -X PUT "10.160.89.17:9200/_cluster/settings?pretty" -H 'Content-Type: application/json' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": null
  }
}
'

curl -X POST "10.160.89.17:9200/_ml/set_upgrade_mode?enabled=false&pretty"
