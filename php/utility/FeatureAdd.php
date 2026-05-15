<?php
declare(strict_types=1);

// DatagovCkan SDK utility: feature_add

class DatagovCkanFeatureAdd
{
    public static function call(DatagovCkanContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
