require File.expand_path("../karma", __FILE__)

module Karma
  class Unit
    def self.test!(opts = {})
      sprockets = Rails.application.assets
      sprockets.append_path Rails.root.join("spec/karma")

      files = sprockets.find_asset("unit.js").to_a.map {|e| e.pathname.to_s }
      files << Rails.root.join("spec/karma/unit/*_spec.coffee").to_s
      files.reject! {|f| f =~ /\.jst/}

      Karma.start!({:files => files, :adapter => :jasmine}.merge(opts))
    end
  end
end
