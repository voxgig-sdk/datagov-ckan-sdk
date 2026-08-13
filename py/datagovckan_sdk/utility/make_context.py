# DatagovCkan SDK utility: make_context

from datagovckan_sdk.core.context import DatagovCkanContext


def make_context_util(ctxmap, basectx):
    return DatagovCkanContext(ctxmap, basectx)
