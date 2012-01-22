require 'spec_helper'

describe "bug_reports/new.html.erb" do
  before(:each) do
    assign(:bug_report, stub_model(BugReport,
      :user_id => 1,
      :bug_type => "MyString",
      :bug_description => "MyString"
    ).as_new_record)
  end

  it "renders new bug_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bug_reports_path, :method => "post" do
      assert_select "input#bug_report_user_id", :name => "bug_report[user_id]"
      assert_select "input#bug_report_bug_type", :name => "bug_report[bug_type]"
      assert_select "input#bug_report_bug_description", :name => "bug_report[bug_description]"
    end
  end
end
