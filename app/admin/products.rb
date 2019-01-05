ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :product, :of, :title, :result, :description, :price, :published, pictures:[], category_ids: []


  form title: 'A custom title' do |f|
    inputs 'Details' do
      input :title
      input :result
      input :description
      input :price
      input :published
      # input :category_ids, as: :check_boxes, collection: Category.all.map { |c| [c.name, c.id] }
      input :pictures, as: :file, input_html: { multiple: true }
    end
    actions
  end

  index do
    id_column
    column :title
    column :result
    column :description
    column :price
    column :published
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :result
      row :description
      row :price
      # row :published do |product|
        # div do
        #   product.categories.each do |c|
        #     div do
        #       c.name
        #     end
        #   end
        # end
      # end
      row :pictures do
        div do
          if product.pictures.present?
            product.pictures.each do |img|
              div do
                image_tag(img.url(:thumb))
                end
              end
            end
          end
        end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
