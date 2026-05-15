# DatagovCkan SDK utility: prepare_body
module DatagovCkanUtilities
  PrepareBody = ->(ctx) {
    ctx.op.input == "data" ? ctx.utility.transform_request.call(ctx) : nil
  }
end
