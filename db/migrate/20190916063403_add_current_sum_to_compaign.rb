class AddCurrentSumToCompaign < ActiveRecord::Migration[5.2]
  def change
    add_column :compaigns, :current_sum, :decimal, default: 0
  end
end
