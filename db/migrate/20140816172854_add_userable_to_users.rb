class AddUserableToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :userable, polymorphic: true, index: true
  end
end
