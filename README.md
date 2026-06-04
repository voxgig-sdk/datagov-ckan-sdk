# DatagovCkan SDK

Search and retrieve metadata about U.S. government datasets cataloged on data.gov via its CKAN API

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Data.gov CKAN API

[Data.gov](https://data.gov/) is the United States government's open data catalog, run by the [General Services Administration](https://www.gsa.gov/). Its public catalog at [catalog.data.gov](https://catalog.data.gov/) is powered by [CKAN](https://ckan.org/), an open-source data management platform, and exposes a standard CKAN Action API at `/api/3/action/...`.

This SDK targets the read-side of that API: searching and retrieving the catalogue's metadata records. You get information *about* datasets — titles, descriptions, tags, organisations, and links to the actual files — rather than the dataset contents themselves, which are hosted by the various publishing agencies.

What you can do via the API:

- Search datasets with Solr-style queries via `package_search`
- Look up a single dataset record via `package_show`
- List or browse groups, organisations, and tags
- Follow `resource` URLs from a dataset record to download the underlying files from their host

Operational notes: the API is an RPC-style JSON interface (`/api/3/action/<function>`), responses wrap results in `{success, result, help}`, and read endpoints are publicly accessible without authentication. CORS is disabled on the public catalog endpoints, so browser-side calls typically need a proxy. Rate limits are not publicly documented; be polite with request volume.

## Try it

**TypeScript**
```bash
npm install datagov-ckan
```

**Python**
```bash
pip install datagov-ckan-sdk
```

**PHP**
```bash
composer require voxgig/datagov-ckan-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/datagov-ckan-sdk/go
```

**Ruby**
```bash
gem install datagov-ckan-sdk
```

**Lua**
```bash
luarocks install datagov-ckan-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { DatagovCkanSDK } from 'datagov-ckan'

const client = new DatagovCkanSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o datagov-ckan-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "datagov-ckan": {
      "command": "/abs/path/to/datagov-ckan-mcp"
    }
  }
}
```

## Entities

The API exposes one entity:

| Entity | Description | API path |
| --- | --- | --- |
| **Dataset** | A catalogue record describing a dataset published on data.gov — title, description, tags, organisation, and links to the underlying resource files; searched via `/api/3/action/package_search` and fetched individually via `/api/3/action/package_show`. | `/action/package_search` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from datagovckan_sdk import DatagovCkanSDK

client = DatagovCkanSDK({})


# Load a specific dataset
dataset, err = client.Dataset(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'datagovckan_sdk.php';

$client = new DatagovCkanSDK([]);


// Load a specific dataset
[$dataset, $err] = $client->Dataset(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/datagov-ckan-sdk/go"

client := sdk.NewDatagovCkanSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "DatagovCkan_sdk"

client = DatagovCkanSDK.new({})


# Load a specific dataset
dataset, err = client.Dataset(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("datagov-ckan_sdk")

local client = sdk.new({})


-- Load a specific dataset
local dataset, err = client:Dataset(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = DatagovCkanSDK.test()
const result = await client.Dataset().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = DatagovCkanSDK.test(None, None)
result, err = client.Dataset(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = DatagovCkanSDK::test(null, null);
[$result, $err] = $client->Dataset(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Dataset(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = DatagovCkanSDK.test(nil, nil)
result, err = client.Dataset(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Dataset(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Data.gov CKAN API

- Upstream: [https://catalog.data.gov/](https://catalog.data.gov/)
- API docs: [https://docs.ckan.org/en/latest/api/index.html](https://docs.ckan.org/en/latest/api/index.html)

- The data.gov catalog is operated by the U.S. General Services Administration; federal works are typically in the public domain in the United States.
- Individual datasets are published by different agencies and may carry their own licences or use restrictions — check each dataset record before reuse.
- This API exposes only catalogue metadata (titles, descriptions, URLs, tags, organisations); the underlying data files live on the publishing agencies' servers and follow their own terms.
- Attribution to the originating agency is recommended even when not strictly required.

---

Generated from the Data.gov CKAN API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
