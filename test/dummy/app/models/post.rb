class Post < ActiveRecord::Base
  include Categorical::Taggable
end
