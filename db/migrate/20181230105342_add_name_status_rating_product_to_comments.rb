class AddNameStatusRatingProductToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :name, :string
    add_column :comments, :status, :boolean, default: false
    add_column :comments, :rating, :integer
  end
end
