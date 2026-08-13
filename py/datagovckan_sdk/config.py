# DatagovCkan SDK configuration


def make_config():
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
            "active": True,
            "name": "author",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "author_email",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "count",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "facets",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "groups",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "license_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "license_title",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "maintainer",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "maintainer_email",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "metadata_created",
            "req": False,
            "type": "`$STRING`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "metadata_modified",
            "req": False,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "notes",
            "req": False,
            "type": "`$STRING`",
            "index$": 13,
          },
          {
            "active": True,
            "name": "organization",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 14,
          },
          {
            "active": True,
            "name": "resources",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 15,
          },
          {
            "active": True,
            "name": "results",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 16,
          },
          {
            "active": True,
            "name": "sort",
            "req": False,
            "type": "`$STRING`",
            "index$": 17,
          },
          {
            "active": True,
            "name": "tags",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 18,
          },
          {
            "active": True,
            "name": "title",
            "req": False,
            "type": "`$STRING`",
            "index$": 19,
          },
          {
            "active": True,
            "name": "url",
            "req": False,
            "type": "`$STRING`",
            "index$": 20,
          },
        ],
        "name": "dataset",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "facet_field",
                      "orig": "facet_field",
                      "reqd": False,
                      "type": "`$ARRAY`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "fq",
                      "orig": "fq",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "example": "*:*",
                      "kind": "query",
                      "name": "q",
                      "orig": "q",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "example": 10,
                      "kind": "query",
                      "name": "row",
                      "orig": "row",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "sort",
                      "orig": "sort",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "example": 0,
                      "kind": "query",
                      "name": "start",
                      "orig": "start",
                      "reqd": False,
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
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
                "index$": 1,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
