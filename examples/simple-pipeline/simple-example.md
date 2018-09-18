## The simple pipeline example

This examples shows how to use the `remove` processor in a simple pipeline.

### How-to run

_Run the commands below from within this directory._

1. Send a simple message to Elasticsearch (creates an index called `simple-index` with `data` as the type):
`curl -s -H 'Content-Type: application/json' -XPOST http://localhost:9200/simple-index/data -d @simple-message.json`
2. Get all documents in the created index (note the `random` field):
`curl -s -XGET http://localhost:9200/simple-index/data/_search?pretty=true`
3. Create the Ingest pipeline:
`curl -s -H 'Content-Type: application/json' -XPUT http://localhost:9200/_ingest/pipeline/simple-pipeline -d @simple-pipeline.json`
4. Send another simple message to Elasticsearch, this using the pipeline (note the query parameter in the URL):
`curl -s -H 'Content-Type: application/json' -XPOST http://localhost:9200/simple-index/data?pipeline=simple-pipeline -d @simple-message.json`
5. Again get all documents in the `simple-index`, the field `random` will be missing from one of the documents:
`curl -s -XGET http://localhost:9200/simple-index/data/_search?pretty=true`