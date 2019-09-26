class ChangeColumnCurrentSum < ActiveRecord::Migration[5.2]
  def change
    change_column :compaigns, :current_sum, :decimal, :precision => 9, :scale => 3, default: 0
  end
end
