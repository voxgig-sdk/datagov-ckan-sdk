<?php
declare(strict_types=1);

// DatagovCkan SDK configuration

class DatagovCkanConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "DatagovCkan",
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
              'name' => 'help',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'result',
              'req' => false,
              'type' => '`$OBJECT`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'success',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'active' => true,
              'index$' => 2,
            ],
          ],
          'name' => 'dataset',
          'op' => [
            'load' => [
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'facet_field',
                        'orig' => 'facet_field',
                        'reqd' => false,
                        'type' => '`$ARRAY`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'fq',
                        'orig' => 'fq',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'example' => '*:*',
                        'kind' => 'query',
                        'name' => 'q',
                        'orig' => 'q',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'example' => 10,
                        'kind' => 'query',
                        'name' => 'row',
                        'orig' => 'row',
                        'reqd' => false,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'sort',
                        'orig' => 'sort',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'example' => 0,
                        'kind' => 'query',
                        'name' => 'start',
                        'orig' => 'start',
                        'reqd' => false,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                    ],
                  ],
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
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'index$' => 0,
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
                        'active' => true,
                      ],
                    ],
                  ],
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
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'index$' => 1,
                ],
              ],
              'input' => 'data',
              'key$' => 'load',
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
