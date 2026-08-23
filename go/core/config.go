package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "DatagovCkan",
			"slug": "datagov-ckan",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://catalog.data.gov/api/3",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"dataset": map[string]any{},
			},
		},
		"entity": map[string]any{
			"dataset": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "author",
						"short": "Dataset author",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "author_email",
						"short": "Author email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "count",
						"short": "Total number of matching datasets",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "facets",
						"short": "Facet results",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "groups",
						"short": "Groups this dataset belongs to",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "id",
						"short": "Dataset identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "license_id",
						"short": "License identifier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "license_title",
						"short": "License title",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "maintainer",
						"short": "Dataset maintainer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "maintainer_email",
						"short": "Maintainer email",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "metadata_created",
						"short": "Metadata creation timestamp",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "metadata_modified",
						"short": "Metadata modification timestamp",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "name",
						"short": "Dataset name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "notes",
						"short": "Dataset description",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "organization",
						"short": "Organization information",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "resources",
						"short": "Dataset resources with URLs",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "results",
						"short": "Array of dataset metadata",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "sort",
						"short": "Sort order used",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "tags",
						"short": "Dataset tags",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "title",
						"short": "Dataset title",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "url",
						"short": "Dataset URL",
						"type": "`$STRING`",
					},
				},
				"name": "dataset",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "facet_field",
											"orig": "facet_field",
											"type": "`$ARRAY`",
										},
										map[string]any{
											"kind": "query",
											"name": "fq",
											"orig": "fq",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": "*:*",
											"kind": "query",
											"name": "q",
											"orig": "q",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 10,
											"kind": "query",
											"name": "row",
											"orig": "row",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "sort",
											"orig": "sort",
											"type": "`$STRING`",
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "start",
											"orig": "start",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/action/package_search",
								"parts": []any{
									"action",
									"package_search",
								},
								"select": map[string]any{
									"exist": []any{
										"facet_field",
										"fq",
										"q",
										"row",
										"sort",
										"start",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.result`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/action/package_show",
								"parts": []any{
									"action",
									"package_show",
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.result`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
