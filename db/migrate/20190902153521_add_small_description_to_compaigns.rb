class AddSmallDescriptionToCompaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :compaigns, :small_description, :text
  end
end
