class ChangeColumnNameInBenefit < ActiveRecord::Migration[5.2]
  def change
        rename_column :benefits, :title, :reward
  end
end
