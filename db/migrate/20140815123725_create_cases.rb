class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :employer_id
      t.string :subject
      t.string :grade
      t.string :location
      t.string :dow
      t.string :time
      t.boolean :close, default: false
      t.text :description

      t.timestamps
    end
  end
end
