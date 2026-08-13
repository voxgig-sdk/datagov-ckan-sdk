# DatagovCkan SDK configuration

module DatagovCkanConfig
  def self.make_config
    {
      "main" => {
        "name" => "DatagovCkan",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://catalog.data.gov/api/3",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "dataset" => {},
        },
      },
      "entity" => {
        "dataset" => {
          "fields" => [
            {
              "active" => true,
              "name" => "author",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "author_email",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "count",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "facets",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "groups",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "license_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "license_title",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "maintainer",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "maintainer_email",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "metadata_created",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 10,
            },
            {
              "active" => true,
              "name" => "metadata_modified",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 11,
            },
            {
              "active" => true,
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 12,
            },
            {
              "active" => true,
              "name" => "notes",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 13,
            },
            {
              "active" => true,
              "name" => "organization",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 14,
            },
            {
              "active" => true,
              "name" => "resources",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 15,
            },
            {
              "active" => true,
              "name" => "results",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 16,
            },
            {
              "active" => true,
              "name" => "sort",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 17,
            },
            {
              "active" => true,
              "name" => "tags",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 18,
            },
            {
              "active" => true,
              "name" => "title",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 19,
            },
            {
              "active" => true,
              "name" => "url",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 20,
            },
          ],
          "name" => "dataset",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "facet_field",
                        "orig" => "facet_field",
                        "reqd" => false,
                        "type" => "`$ARRAY`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "fq",
                        "orig" => "fq",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => "*:*",
                        "kind" => "query",
                        "name" => "q",
                        "orig" => "q",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => 10,
                        "kind" => "query",
                        "name" => "row",
                        "orig" => "row",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "sort",
                        "orig" => "sort",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "example" => 0,
                        "kind" => "query",
                        "name" => "start",
                        "orig" => "start",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/action/package_search",
                  "parts" => [
                    "action",
                    "package_search",
                  ],
                  "select" => {
                    "exist" => [
                      "facet_field",
                      "fq",
                      "q",
                      "row",
                      "sort",
                      "start",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.result`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/action/package_show",
                  "parts" => [
                    "action",
                    "package_show",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.result`",
                  },
                  "index$" => 1,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    DatagovCkanFeatures.make_feature(name)
  end
end
