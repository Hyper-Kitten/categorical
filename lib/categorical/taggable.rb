module Categorical
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, as: :taggable, class_name: "::Categorical::Tagging"
      has_many :tags, :through => :taggings, class_name: "::Categorical::Tag"
    end
  end
end
