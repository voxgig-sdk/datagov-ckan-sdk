# frozen_string_literal: true

# Typed models for the DatagovCkan SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Dataset entity data model.
#
# @!attribute [rw] author
#   @return [String, nil]
#
# @!attribute [rw] author_email
#   @return [String, nil]
#
# @!attribute [rw] count
#   @return [Integer, nil]
#
# @!attribute [rw] facets
#   @return [Hash, nil]
#
# @!attribute [rw] groups
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] license_id
#   @return [String, nil]
#
# @!attribute [rw] license_title
#   @return [String, nil]
#
# @!attribute [rw] maintainer
#   @return [String, nil]
#
# @!attribute [rw] maintainer_email
#   @return [String, nil]
#
# @!attribute [rw] metadata_created
#   @return [String, nil]
#
# @!attribute [rw] metadata_modified
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] notes
#   @return [String, nil]
#
# @!attribute [rw] organization
#   @return [Hash, nil]
#
# @!attribute [rw] resources
#   @return [Array, nil]
#
# @!attribute [rw] results
#   @return [Array, nil]
#
# @!attribute [rw] sort
#   @return [String, nil]
#
# @!attribute [rw] tags
#   @return [Array, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
#
# @!attribute [rw] url
#   @return [String, nil]
Dataset = Struct.new(
  :author,
  :author_email,
  :count,
  :facets,
  :groups,
  :id,
  :license_id,
  :license_title,
  :maintainer,
  :maintainer_email,
  :metadata_created,
  :metadata_modified,
  :name,
  :notes,
  :organization,
  :resources,
  :results,
  :sort,
  :tags,
  :title,
  :url,
  keyword_init: true
)

# Request payload for Dataset#load.
#
# @!attribute [rw] facet_field
#   @return [Array, nil]
#
# @!attribute [rw] fq
#   @return [String, nil]
#
# @!attribute [rw] q
#   @return [String, nil]
#
# @!attribute [rw] row
#   @return [Integer, nil]
#
# @!attribute [rw] sort
#   @return [String, nil]
#
# @!attribute [rw] start
#   @return [Integer, nil]
DatasetLoadMatch = Struct.new(
  :facet_field,
  :fq,
  :q,
  :row,
  :sort,
  :start,
  keyword_init: true
)

