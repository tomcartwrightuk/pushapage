class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :test_option
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
