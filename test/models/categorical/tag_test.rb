require 'test_helper'

module Categorical
  class TagTest < ActiveSupport::TestCase
    def test_has_many_taggings
      tag = Tag.create!(label: "label")
      tagging = Tagging.create!(tag: tag)

      assert_equal(tag.taggings, [tagging])
    end

    def test_validates_presence_of_label
      exp = assert_raises { Tag.create! }
      assert_match(/Validation failed: Label can't be blank/, exp.message)
    end

    def test_validates_uniqueness_of_label
      Tag.create!(label: "label")
      exp = assert_raises { Tag.create!(label: "label") }
      assert_match(/Label has already been taken/, exp.message)
    end

    def test_validates_uniqueness_of_label_not_case_sensitive
      Tag.create!(label: "Label")
      exp = assert_raises { Tag.create!(label: "label") }
      assert_match(/Label has already been taken/, exp.message)
    end

    def test_validates_length_of_label
      exp = assert_raises do
        label = 'x' * 255
        Tag.create!(label: label)
      end
      assert_match(/Label is too long \(maximum is 244 characters\)/, exp.message)
    end

    def test_to_s
      tag = Tag.create!(label: "label")

      assert_equal("label", tag.to_s)
    end

    def test_fetching_taggables_by_class
      post = Post.new
      tag = Tag.new(label: "tag")

      post.tags << tag
      post.save!

      assert_equal(tag.posts, [post])
    end
  end
end
