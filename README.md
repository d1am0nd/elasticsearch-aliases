# Recreates funky Elasticsearch alias-update behaviour

Blog post: https://kordes.dev/posts/updating-elasticsearch-aliases-is-sometimes-atomic

## Setup

Install elixir

Install dependencies `mix deps.get`

Run opensearch `docker run -p 9200:9200 -e "discovery.type=single-node" -e "xpack.security.enabled=false" elasticsearch:8.18.0`

Setup indices `mix run lib/create_indices.exs`

## Play with various alias settings

### Concurrently unset alias from all indices and set them to 2 separate indices

`mix run lib/alias_concurrent.exs`

Execute a few times and this will unexpectedly result in `alias_1` pointing to two indices

### Concurrently unset alias from all indices and set them to 2 separate indices

`mix run lib/alias_concurrent_write_index.exs`

Enforce alias will only be set to 1 index by setting `is_write_index: true`

### Prove atomicity within alias update request

`mix run lib/fail_two_aliases.exs`

Runs two alias updates, one of which will fail -> resulting in request not being executed at all

### Successfully apply two aliases

`mix run lib/apply_two_aliases.exs`

Runs two alias updates, both of which will succeed


