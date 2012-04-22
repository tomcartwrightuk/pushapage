class DeleteBugReports < ActiveRecord::Migration
  def self.up
     drop_table :bug_reports  
  end

  def self.down
     drop_table :bug_reports  
  end
end
