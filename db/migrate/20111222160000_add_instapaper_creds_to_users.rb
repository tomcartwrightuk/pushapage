class AddInstapaperCredsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :instapaper_user, :string
    add_column :users, :instapaper_pass, :string
  end

  def self.down
    remove_column :users, :instapaper_user, :string
    remove_column :users, :instapaper_pass, :string
  end
end
