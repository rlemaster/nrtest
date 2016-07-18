class AddOrgIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :org_id, :int
  end
end
