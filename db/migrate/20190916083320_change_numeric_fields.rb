class ChangeNumericFields < ActiveRecord::Migration[5.2]
  def change
    change_column :compaigns, :current_sum, :decimal, default: 0
    change_column :compaigns, :goal, :decimal
  end
end
