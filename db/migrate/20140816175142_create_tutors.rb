class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.text :description
      t.string :education_level
    end
  end
end
