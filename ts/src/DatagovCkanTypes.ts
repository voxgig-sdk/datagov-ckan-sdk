// Typed models for the DatagovCkan SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Dataset {
  author?: string
  author_email?: string
  count?: number
  facets?: Record<string, any>
  groups?: any[]
  id?: string
  license_id?: string
  license_title?: string
  maintainer?: string
  maintainer_email?: string
  metadata_created?: string
  metadata_modified?: string
  name?: string
  notes?: string
  organization?: Record<string, any>
  resources?: any[]
  results?: any[]
  sort?: string
  tags?: any[]
  title?: string
  url?: string
}

export interface DatasetLoadMatch {
  author?: string
  author_email?: string
  count?: number
  facets?: Record<string, any>
  groups?: any[]
  id: string
  license_id?: string
  license_title?: string
  maintainer?: string
  maintainer_email?: string
  metadata_created?: string
  metadata_modified?: string
  name?: string
  notes?: string
  organization?: Record<string, any>
  resources?: any[]
  results?: any[]
  sort?: string
  tags?: any[]
  title?: string
  url?: string
}

