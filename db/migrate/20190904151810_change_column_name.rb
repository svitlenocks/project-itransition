class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :compaigns, :small_description, :project_idea
  end
end
