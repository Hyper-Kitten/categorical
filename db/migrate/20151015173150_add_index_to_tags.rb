class AddIndexToTags < ActiveRecord::Migration
  def change
    add_index :categorical_tags, :label, unique: true
  end
end
