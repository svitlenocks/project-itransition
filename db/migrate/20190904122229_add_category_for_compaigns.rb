class AddCategoryForCompaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :compaigns, :category, :string
  end
end
