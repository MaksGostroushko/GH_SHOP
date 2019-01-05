class CreateSitePages < ActiveRecord::Migration[5.2]
  def change
    create_table :site_pages do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
