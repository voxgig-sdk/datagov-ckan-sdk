-- DatagovCkan SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "DatagovCkan",
      slug = "datagov-ckan",
      version = "0.0.1",
      target = "lua",
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
            ["short"] = "Dataset author",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "author_email",
            ["short"] = "Author email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "count",
            ["short"] = "Total number of matching datasets",
            ["type"] = "`$INTEGER`",
          },
          {
            ["name"] = "facets",
            ["short"] = "Facet results",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "groups",
            ["short"] = "Groups this dataset belongs to",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "id",
            ["short"] = "Dataset identifier",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "license_id",
            ["short"] = "License identifier",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "license_title",
            ["short"] = "License title",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "maintainer",
            ["short"] = "Dataset maintainer",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "maintainer_email",
            ["short"] = "Maintainer email",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "metadata_created",
            ["short"] = "Metadata creation timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "metadata_modified",
            ["short"] = "Metadata modification timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "name",
            ["short"] = "Dataset name",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "notes",
            ["short"] = "Dataset description",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "organization",
            ["short"] = "Organization information",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "resources",
            ["short"] = "Dataset resources with URLs",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "results",
            ["short"] = "Array of dataset metadata",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "sort",
            ["short"] = "Sort order used",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "tags",
            ["short"] = "Dataset tags",
            ["type"] = "`$ARRAY`",
          },
          {
            ["name"] = "title",
            ["short"] = "Dataset title",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "url",
            ["short"] = "Dataset URL",
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
