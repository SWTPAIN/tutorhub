class CreateSubjectTags < ActiveRecord::Migration
  def change
    create_table :subject_tags do |t|
      t.integer :subject_id
      t.integer :subject_taggable_type
      t.integer :subject_taggable_id
    end
  end
end
