<?php
declare(strict_types=1);

// DatagovCkan SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class DatagovCkanMakeContext
{
    public static function call(array $ctxmap, ?DatagovCkanContext $basectx): DatagovCkanContext
    {
        return new DatagovCkanContext($ctxmap, $basectx);
    }
}
