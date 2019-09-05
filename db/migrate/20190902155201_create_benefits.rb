class CreateBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :benefits do |t|
      t.string :title
      t.text :description
      t.decimal :sum
      t.references :compaign, foreign_key: true

      t.timestamps
    end
  end
end
