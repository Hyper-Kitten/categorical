module Categorical
  class Tag < ActiveRecord::Base
    has_many :taggings

    validates :label, presence: true, uniqueness: { case_sensitive: false }
    validates :label, length: { maximum: 244 }

    def to_s
      label
    end

    # Override #method_missing to allow the class to attempt to find tagged
    # taggables of the given type. 
    #
    # For example when `tag.posts` is called method_missing will attempt to
    # find any taggings of type post and then grab them in an active record
    # query
    def method_missing(name, *args)
      klass_name = name.to_s.singularize.camelcase
      klass = klass_name.constantize

      klass_instance_ids =
        taggings.where(taggable_type: klass_name).map(&:taggable_id)

      klass.where(id: klass_instance_ids)

      rescue NameError
        super
    end
  end
end
