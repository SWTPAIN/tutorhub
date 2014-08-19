class AddIndexToCases < ActiveRecord::Migration
  def up
    execute "create index cases_title on cases using  gin(to_tsvector('english', title))"
    execute "create index cases_description on cases using gin(to_tsvector('english', description))"
  end

  def down
    execute "drop index cases_title"
    execute "drop index cases_description"
  end
end
