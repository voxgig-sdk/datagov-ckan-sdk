# DatagovCkan SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module DatagovCkanFeatures
  def self.make_feature(name)
    case name
    when "base"
      DatagovCkanBaseFeature.new
    when "test"
      DatagovCkanTestFeature.new
    else
      DatagovCkanBaseFeature.new
    end
  end
end
