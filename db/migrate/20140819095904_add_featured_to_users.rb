class AddFeaturedToUsers < ActiveRecord::Migration
  def change
    add_column :tutors, :featured, :boolean, default: false
  end
end
