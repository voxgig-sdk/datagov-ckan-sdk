
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    }

  }


  options = {
    base: 'http://catalog.data.gov/api/3',

    auth: {
      prefix: 'Bearer',
    },

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      dataset: {
      },

    }
  }


  entity = {
    "dataset": {
      "fields": [
        {
          "name": "help",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 0
        },
        {
          "name": "result",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 1
        },
        {
          "name": "success",
          "req": false,
          "type": "`$BOOLEAN`",
          "active": true,
          "index$": 2
        }
      ],
      "name": "dataset",
      "op": {
        "load": {
          "name": "load",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "facet_field",
                    "orig": "facet_field",
                    "reqd": false,
                    "type": "`$ARRAY`",
                    "active": true
                  },
                  {
                    "kind": "query",
                    "name": "fq",
                    "orig": "fq",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": "*:*",
                    "kind": "query",
                    "name": "q",
                    "orig": "q",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "row",
                    "orig": "row",
                    "reqd": false,
                    "type": "`$INTEGER`",
                    "active": true
                  },
                  {
                    "kind": "query",
                    "name": "sort",
                    "orig": "sort",
                    "reqd": false,
                    "type": "`$STRING`",
                    "active": true
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "start",
                    "orig": "start",
                    "reqd": false,
                    "type": "`$INTEGER`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/action/package_search",
              "parts": [
                "action",
                "package_search"
              ],
              "select": {
                "exist": [
                  "facet_field",
                  "fq",
                  "q",
                  "row",
                  "sort",
                  "start"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 0
            },
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "active": true
                  }
                ]
              },
              "method": "GET",
              "orig": "/action/package_show",
              "parts": [
                "action",
                "package_show"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "index$": 1
            }
          ],
          "input": "data",
          "key$": "load"
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

