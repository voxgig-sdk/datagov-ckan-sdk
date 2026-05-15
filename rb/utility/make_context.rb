# DatagovCkan SDK utility: make_context
require_relative '../core/context'
module DatagovCkanUtilities
  MakeContext = ->(ctxmap, basectx) {
    DatagovCkanContext.new(ctxmap, basectx)
  }
end
