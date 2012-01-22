class CreateBugReports < ActiveRecord::Migration
  def self.up
    create_table :bug_reports do |t|
      t.integer :user_id
      t.string :bug_type
      t.string :bug_description

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_reports
  end
end
