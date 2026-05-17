package voxgigdatagovckansdk

import (
	"github.com/voxgig-sdk/datagov-ckan-sdk/go/core"
	"github.com/voxgig-sdk/datagov-ckan-sdk/go/entity"
	"github.com/voxgig-sdk/datagov-ckan-sdk/go/feature"
	_ "github.com/voxgig-sdk/datagov-ckan-sdk/go/utility"
)

// Type aliases preserve external API.
type DatagovCkanSDK = core.DatagovCkanSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type DatagovCkanEntity = core.DatagovCkanEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type DatagovCkanError = core.DatagovCkanError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewDatasetEntityFunc = func(client *core.DatagovCkanSDK, entopts map[string]any) core.DatagovCkanEntity {
		return entity.NewDatasetEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewDatagovCkanSDK = core.NewDatagovCkanSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
