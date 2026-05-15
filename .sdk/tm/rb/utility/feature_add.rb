# DatagovCkan SDK utility: feature_add
module DatagovCkanUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
