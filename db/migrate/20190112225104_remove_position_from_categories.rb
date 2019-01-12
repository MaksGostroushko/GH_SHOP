class RemovePositionFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :position, :integer
  end
end
