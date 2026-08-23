<?php
declare(strict_types=1);

// DatagovCkan SDK configuration

class DatagovCkanConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "DatagovCkan",
                "slug" => "datagov-ckan",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://catalog.data.gov/api/3",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "dataset" => [],
                ],
            ],
            "entity" => [
        'dataset' => [
          'fields' => [
            [
              'name' => 'author',
              'short' => 'Dataset author',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'author_email',
              'short' => 'Author email',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'count',
              'short' => 'Total number of matching datasets',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'facets',
              'short' => 'Facet results',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'groups',
              'short' => 'Groups this dataset belongs to',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'id',
              'short' => 'Dataset identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'license_id',
              'short' => 'License identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'license_title',
              'short' => 'License title',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'maintainer',
              'short' => 'Dataset maintainer',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'maintainer_email',
              'short' => 'Maintainer email',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'metadata_created',
              'short' => 'Metadata creation timestamp',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'metadata_modified',
              'short' => 'Metadata modification timestamp',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'name',
              'short' => 'Dataset name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'notes',
              'short' => 'Dataset description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'organization',
              'short' => 'Organization information',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'resources',
              'short' => 'Dataset resources with URLs',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'results',
              'short' => 'Array of dataset metadata',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'sort',
              'short' => 'Sort order used',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'tags',
              'short' => 'Dataset tags',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'title',
              'short' => 'Dataset title',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'url',
              'short' => 'Dataset URL',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'dataset',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'facet_field',
                        'orig' => 'facet_field',
                        'type' => '`$ARRAY`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'fq',
                        'orig' => 'fq',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => '*:*',
                        'kind' => 'query',
                        'name' => 'q',
                        'orig' => 'q',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 10,
                        'kind' => 'query',
                        'name' => 'row',
                        'orig' => 'row',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'sort',
                        'orig' => 'sort',
                        'type' => '`$STRING`',
                      ],
                      [
                        'example' => 0,
                        'kind' => 'query',
                        'name' => 'start',
                        'orig' => 'start',
                        'type' => '`$INTEGER`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/action/package_search',
                  'parts' => [
                    'action',
                    'package_search',
                  ],
                  'select' => [
                    'exist' => [
                      'facet_field',
                      'fq',
                      'q',
                      'row',
                      'sort',
                      'start',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.result`',
                  ],
                ],
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'id',
                        'orig' => 'id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/action/package_show',
                  'parts' => [
                    'action',
                    'package_show',
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body.result`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return DatagovCkanFeatures::make_feature($name);
    }
}
