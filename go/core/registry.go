package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewDatasetEntityFunc func(client *DatagovCkanSDK, entopts map[string]any) DatagovCkanEntity

