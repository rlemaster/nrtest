class AddOrgIdToHost < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :org_id, :int
  end
end
