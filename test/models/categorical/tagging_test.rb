require 'test_helper'

module Categorical
  class TaggingTest < ActiveSupport::TestCase
    def test_tagging_belongs_to_tag
      tag = Tag.create!(label: 'label')
      tagging = Tagging.create!

      tagging.tag = tag
      tagging.save!

      assert_equal(tagging.tag, tag)
    end

    def test_tagging_belongs_to_taggable
      taggable = Post.create!
      tagging = Tagging.create!

      tagging.taggable = taggable
      tagging.save!

      assert_equal(tagging.taggable, taggable)
    end
  end
end
