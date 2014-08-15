class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :user_id
      t.string :subject
      t.string :grade
      t.string :location
      t.string :dowm
      t.string :time
      t.text :description

      t.timestamps
    end
  end
end
