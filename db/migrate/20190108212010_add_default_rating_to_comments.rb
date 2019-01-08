class AddDefaultRatingToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :rating, :integer, default: 0
  end
end
