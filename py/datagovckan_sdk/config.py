# DatagovCkan SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "DatagovCkan",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://catalog.data.gov/api/3",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "dataset": {},
            },
        },
        "entity": {
      "dataset": {
        "fields": [
          {
            "name": "author",
            "type": "`$STRING`",
          },
          {
            "name": "author_email",
            "type": "`$STRING`",
          },
          {
            "name": "count",
            "type": "`$INTEGER`",
          },
          {
            "name": "facets",
            "type": "`$OBJECT`",
          },
          {
            "name": "groups",
            "type": "`$ARRAY`",
          },
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "license_id",
            "type": "`$STRING`",
          },
          {
            "name": "license_title",
            "type": "`$STRING`",
          },
          {
            "name": "maintainer",
            "type": "`$STRING`",
          },
          {
            "name": "maintainer_email",
            "type": "`$STRING`",
          },
          {
            "name": "metadata_created",
            "type": "`$STRING`",
          },
          {
            "name": "metadata_modified",
            "type": "`$STRING`",
          },
          {
            "name": "name",
            "type": "`$STRING`",
          },
          {
            "name": "notes",
            "type": "`$STRING`",
          },
          {
            "name": "organization",
            "type": "`$OBJECT`",
          },
          {
            "name": "resources",
            "type": "`$ARRAY`",
          },
          {
            "name": "results",
            "type": "`$ARRAY`",
          },
          {
            "name": "sort",
            "type": "`$STRING`",
          },
          {
            "name": "tags",
            "type": "`$ARRAY`",
          },
          {
            "name": "title",
            "type": "`$STRING`",
          },
          {
            "name": "url",
            "type": "`$STRING`",
          },
        ],
        "name": "dataset",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "facet_field",
                      "orig": "facet_field",
                      "type": "`$ARRAY`",
                    },
                    {
                      "kind": "query",
                      "name": "fq",
                      "orig": "fq",
                      "type": "`$STRING`",
                    },
                    {
                      "example": "*:*",
                      "kind": "query",
                      "name": "q",
                      "orig": "q",
                      "type": "`$STRING`",
                    },
                    {
                      "example": 10,
                      "kind": "query",
                      "name": "row",
                      "orig": "row",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "sort",
                      "orig": "sort",
                      "type": "`$STRING`",
                    },
                    {
                      "example": 0,
                      "kind": "query",
                      "name": "start",
                      "orig": "start",
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/action/package_search",
                "parts": [
                  "action",
                  "package_search",
                ],
                "select": {
                  "exist": [
                    "facet_field",
                    "fq",
                    "q",
                    "row",
                    "sort",
                    "start",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.result`",
                },
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "id",
                      "orig": "id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/action/package_show",
                "parts": [
                  "action",
                  "package_show",
                ],
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.result`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
