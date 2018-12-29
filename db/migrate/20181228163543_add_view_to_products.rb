class AddViewToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :view, :datetime
  end
end
