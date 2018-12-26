class AddPicturesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pictures, :json
  end
end
