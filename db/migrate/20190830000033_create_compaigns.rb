class CreateCompaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :compaigns do |t|
      t.string :title
      t.text :description
      t.decimal :goal, :precision => 9, :scale => 3
      t.datetime :endtime
      t.string :video
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
