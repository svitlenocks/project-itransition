class AddBenefitsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :benefits, :string
  end
end
