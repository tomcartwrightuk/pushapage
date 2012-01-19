class AddTitleToSiteReferences < ActiveRecord::Migration
  def self.up
    add_column :site_references, :title, :string
  end

  def self.down
    remove_column :site_references, :title, :string
  end

end
