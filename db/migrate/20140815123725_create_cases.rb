class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :employer_id
      t.string :title
      t.text :description
      t.string :grade
      t.string :location
      t.string :dow
      t.string :time
      t.boolean :close, default: false

      t.timestamps
    end
  end
end
