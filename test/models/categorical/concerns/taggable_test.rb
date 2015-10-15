require 'test_helper'

module Categorical
  class TaggableTest < ActiveSupport::TestCase
    def test_taggable_has_many_tags_through_taggings
      taggable = Post.new
      tag = Tag.new(label: "tag")

      taggable.tags << tag
      taggable.save!

      assert_equal(taggable.tags, [tag])
    end
  end
end
