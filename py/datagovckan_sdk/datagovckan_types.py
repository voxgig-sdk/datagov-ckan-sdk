# Typed models for the DatagovCkan SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Dataset(TypedDict, total=False):
    author: str
    author_email: str
    count: int
    facets: dict
    groups: list
    id: str
    license_id: str
    license_title: str
    maintainer: str
    maintainer_email: str
    metadata_created: str
    metadata_modified: str
    name: str
    notes: str
    organization: dict
    resources: list
    results: list
    sort: str
    tags: list
    title: str
    url: str


class DatasetLoadMatchRequired(TypedDict):
    id: str


class DatasetLoadMatch(DatasetLoadMatchRequired, total=False):
    author: str
    author_email: str
    count: int
    facets: dict
    groups: list
    license_id: str
    license_title: str
    maintainer: str
    maintainer_email: str
    metadata_created: str
    metadata_modified: str
    name: str
    notes: str
    organization: dict
    resources: list
    results: list
    sort: str
    tags: list
    title: str
    url: str
