# DatagovCkan SDK utility: make_context

from projectname_sdk.core.context import DatagovCkanContext


def make_context_util(ctxmap, basectx):
    return DatagovCkanContext(ctxmap, basectx)
