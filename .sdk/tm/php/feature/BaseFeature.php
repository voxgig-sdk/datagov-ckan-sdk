<?php
declare(strict_types=1);

// DatagovCkan SDK base feature

class DatagovCkanBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(DatagovCkanContext $ctx, array $options): void {}
    public function PostConstruct(DatagovCkanContext $ctx): void {}
    public function PostConstructEntity(DatagovCkanContext $ctx): void {}
    public function SetData(DatagovCkanContext $ctx): void {}
    public function GetData(DatagovCkanContext $ctx): void {}
    public function GetMatch(DatagovCkanContext $ctx): void {}
    public function SetMatch(DatagovCkanContext $ctx): void {}
    public function PrePoint(DatagovCkanContext $ctx): void {}
    public function PreSpec(DatagovCkanContext $ctx): void {}
    public function PreRequest(DatagovCkanContext $ctx): void {}
    public function PreResponse(DatagovCkanContext $ctx): void {}
    public function PreResult(DatagovCkanContext $ctx): void {}
    public function PreDone(DatagovCkanContext $ctx): void {}
    public function PreUnexpected(DatagovCkanContext $ctx): void {}
}
