<?php
declare(strict_types=1);

// Typed models for the DatagovCkan SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Dataset entity data model. */
class Dataset
{
    public ?string $author = null;
    public ?string $author_email = null;
    public ?int $count = null;
    public ?array $facets = null;
    public ?array $groups = null;
    public ?string $id = null;
    public ?string $license_id = null;
    public ?string $license_title = null;
    public ?string $maintainer = null;
    public ?string $maintainer_email = null;
    public ?string $metadata_created = null;
    public ?string $metadata_modified = null;
    public ?string $name = null;
    public ?string $notes = null;
    public ?array $organization = null;
    public ?array $resources = null;
    public ?array $results = null;
    public ?string $sort = null;
    public ?array $tags = null;
    public ?string $title = null;
    public ?string $url = null;
}

/** Request payload for Dataset#load. */
class DatasetLoadMatch
{
    public ?array $facet_field = null;
    public ?string $fq = null;
    public ?string $q = null;
    public ?int $row = null;
    public ?string $sort = null;
    public ?int $start = null;
}

