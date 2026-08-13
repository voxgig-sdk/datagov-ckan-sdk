-- Typed models for the DatagovCkan SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Dataset
---@field author? string
---@field author_email? string
---@field count? number
---@field facets? table
---@field groups? table
---@field id? string
---@field license_id? string
---@field license_title? string
---@field maintainer? string
---@field maintainer_email? string
---@field metadata_created? string
---@field metadata_modified? string
---@field name? string
---@field notes? string
---@field organization? table
---@field resources? table
---@field results? table
---@field sort? string
---@field tags? table
---@field title? string
---@field url? string

---@class DatasetLoadMatch
---@field author? string
---@field author_email? string
---@field count? number
---@field facets? table
---@field groups? table
---@field id string
---@field license_id? string
---@field license_title? string
---@field maintainer? string
---@field maintainer_email? string
---@field metadata_created? string
---@field metadata_modified? string
---@field name? string
---@field notes? string
---@field organization? table
---@field resources? table
---@field results? table
---@field sort? string
---@field tags? table
---@field title? string
---@field url? string

local M = {}

return M
