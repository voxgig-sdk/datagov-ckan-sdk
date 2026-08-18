-- DatagovCkan SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "DatagovCkan",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://catalog.data.gov/api/3",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["dataset"] = {},
      },
    },
    entity = {
      ["dataset"] = {
        ["fields"] = {
          {
            ["name"] = "author",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "author_email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "count",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "facets",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "groups",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "license_id",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "license_title",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "maintainer",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "maintainer_email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "metadata_created",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "metadata_modified",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "notes",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "organization",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "resources",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "results",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "sort",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "tags",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "title",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "url",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "dataset",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "facet_field",
                      ["orig"] = "facet_field",
                      ["type"] = "`$ARRAY`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "fq",
                      ["orig"] = "fq",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = "*:*",
                      ["kind"] = "query",
                      ["name"] = "q",
                      ["orig"] = "q",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 10,
                      ["kind"] = "query",
                      ["name"] = "row",
                      ["orig"] = "row",
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "sort",
                      ["orig"] = "sort",
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["example"] = 0,
                      ["kind"] = "query",
                      ["name"] = "start",
                      ["orig"] = "start",
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/action/package_search",
                ["parts"] = {
                  "action",
                  "package_search",
                },
                ["select"] = {
                  ["exist"] = {
                    "facet_field",
                    "fq",
                    "q",
                    "row",
                    "sort",
                    "start",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.result`",
                },
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/action/package_show",
                ["parts"] = {
                  "action",
                  "package_show",
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.result`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
