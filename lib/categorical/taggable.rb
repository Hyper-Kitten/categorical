module Categorical
  module Taggable
    extend ActiveSupport::Concern

    included do
      has_many :taggings, as: :taggable, class_name: "::Categorical::Tagging"
      has_many :tags, :through => :taggings, class_name: "::Categorical::Tag"

      # method_name = "#{self.name.underscore}s"
      # ::Categorical::Tag.define_method(method_name) do
      #   klass_name = method_name.to_s.singularize.camelcase
      #   klass = klass_name.constantize
      #
      #   klass_instance_ids =
      #     taggings.where(taggable_type: klass_name).map(&:taggable_id)
      #
      #   klass.where(id: klass_instance_ids)
      # end
    end
  end
end
