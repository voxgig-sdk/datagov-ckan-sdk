<?php
declare(strict_types=1);

// DatagovCkan SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class DatagovCkanFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new DatagovCkanBaseFeature();
            case "test":
                return new DatagovCkanTestFeature();
            default:
                return new DatagovCkanBaseFeature();
        }
    }
}
