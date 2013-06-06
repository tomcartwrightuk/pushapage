class DropOptionsAndMessages < ActiveRecord::Migration
  def up
    drop_table :options
    drop_table :messages
  end

  def down
    create_table :options do |t|
      t.string :test_option
      t.integer :user_id

      t.timestamps
    end
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
