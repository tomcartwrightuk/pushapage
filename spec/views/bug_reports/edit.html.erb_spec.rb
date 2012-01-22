require 'spec_helper'

describe "bug_reports/edit.html.erb" do
  before(:each) do
    @bug_report = assign(:bug_report, stub_model(BugReport,
      :user_id => 1,
      :bug_type => "MyString",
      :bug_description => "MyString"
    ))
  end

  it "renders the edit bug_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bug_reports_path(@bug_report), :method => "post" do
      assert_select "input#bug_report_user_id", :name => "bug_report[user_id]"
      assert_select "input#bug_report_bug_type", :name => "bug_report[bug_type]"
      assert_select "input#bug_report_bug_description", :name => "bug_report[bug_description]"
    end
  end
end
