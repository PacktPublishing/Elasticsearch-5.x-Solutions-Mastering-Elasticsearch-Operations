curl -XPOST 'http://127.0.0.1:9200/_search/template?pretty' -d '
{
    "inline": {
        "query": {
            "term": {
              "uuid": "{{value}}"
            }
        }
    },
    "params": {
        "value": "22222"
    }
}'


curl -XPOST 'http://127.0.0.1:9200/_search/template/myTemplate' -d '
{
    "template": {
        "query": {
            "term": {
              "uuid": "{{value}}"
            }
        }
    }
}'


curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
 "query":
 {
    "template": {
    "id": "myTemplate",
  "params": {
    "value": "22222"
  }
  }}
}'

curl -XPOST 'http://127.0.0.1:9200/_render/template?pretty' -d '{
  "id": "myTemplate",
  "params": {
    "value": "22222"
  }
}'

