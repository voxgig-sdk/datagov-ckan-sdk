package = "voxgig-sdk-datagov-ckan"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/datagov-ckan-sdk.git"
}
description = {
  summary = "DatagovCkan SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["datagov-ckan_sdk"] = "datagov-ckan_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
