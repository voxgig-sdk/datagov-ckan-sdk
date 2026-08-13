# DatagovCkan SDK feature factory

from datagovckan_sdk.feature.base_feature import DatagovCkanBaseFeature
from datagovckan_sdk.feature.test_feature import DatagovCkanTestFeature


def _make_feature(name):
    features = {
        "base": lambda: DatagovCkanBaseFeature(),
        "test": lambda: DatagovCkanTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
