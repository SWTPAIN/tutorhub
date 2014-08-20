class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.boolean :gender
      t.text :description
      t.string :education_level
      t.string :institute
      t.boolean :featured, default: false
    end
  end
end
