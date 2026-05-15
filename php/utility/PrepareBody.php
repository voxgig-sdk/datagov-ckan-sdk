<?php
declare(strict_types=1);

// DatagovCkan SDK utility: prepare_body

class DatagovCkanPrepareBody
{
    public static function call(DatagovCkanContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
