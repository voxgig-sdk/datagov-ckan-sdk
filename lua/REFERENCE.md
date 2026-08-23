# DatagovCkan Lua SDK Reference

Complete API reference for the DatagovCkan Lua SDK.


## DatagovCkanSDK

### Constructor

```lua
local sdk = require("datagov-ckan_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Dataset(data)`

Create a new `Dataset` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## DatasetEntity

```lua
local dataset = client:Dataset(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `author` | `string` | No | Dataset author |
| `author_email` | `string` | No | Author email |
| `count` | `number` | No | Total number of matching datasets |
| `facets` | `table` | No | Facet results |
| `groups` | `table` | No | Groups this dataset belongs to |
| `id` | `string` | No | Dataset identifier |
| `license_id` | `string` | No | License identifier |
| `license_title` | `string` | No | License title |
| `maintainer` | `string` | No | Dataset maintainer |
| `maintainer_email` | `string` | No | Maintainer email |
| `metadata_created` | `string` | No | Metadata creation timestamp |
| `metadata_modified` | `string` | No | Metadata modification timestamp |
| `name` | `string` | No | Dataset name |
| `notes` | `string` | No | Dataset description |
| `organization` | `table` | No | Organization information |
| `resources` | `table` | No | Dataset resources with URLs |
| `results` | `table` | No | Array of dataset metadata |
| `sort` | `string` | No | Sort order used |
| `tags` | `table` | No | Dataset tags |
| `title` | `string` | No | Dataset title |
| `url` | `string` | No | Dataset URL |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Dataset():load({ id = "dataset_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DatasetEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

