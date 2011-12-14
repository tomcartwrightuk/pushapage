class CreateSiteReferences < ActiveRecord::Migration
  def self.up
    create_table :site_references do |t|
      t.string :reference

      t.timestamps
    end
  end

  def self.down
    drop_table :site_references
  end
end
