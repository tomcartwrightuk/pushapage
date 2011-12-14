class AddUserIdSiteReferences < ActiveRecord::Migration
  def self.up
    add_column :site_references, :user_id, :integer
  end

  def self.down
    remove_column :site_references, :user_id, :integer
  end
end
