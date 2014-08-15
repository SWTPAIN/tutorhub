class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.timestamps
    end
  end
end
