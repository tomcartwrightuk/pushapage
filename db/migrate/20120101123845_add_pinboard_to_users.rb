class AddPinboardToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pinboard_user, :string
    add_column :users, :pinboard_pass, :string
  end

  def self.down
    remove_column :users, :pinboard_user, :string
    remove_column :users, :pinboard_pass, :string
  end
end
