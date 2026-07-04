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
# @!attribute [rw] help
#   @return [String, nil]
#
# @!attribute [rw] result
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
Dataset = Struct.new(
  :help,
  :result,
  :success,
  keyword_init: true
)

# Match filter for Dataset#load (any subset of Dataset fields).
#
# @!attribute [rw] help
#   @return [String, nil]
#
# @!attribute [rw] result
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
DatasetLoadMatch = Struct.new(
  :help,
  :result,
  :success,
  keyword_init: true
)

