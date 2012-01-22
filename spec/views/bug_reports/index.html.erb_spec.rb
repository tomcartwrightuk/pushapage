require 'spec_helper'

describe "bug_reports/index.html.erb" do
  before(:each) do
    assign(:bug_reports, [
      stub_model(BugReport,
        :user_id => 1,
        :bug_type => "Bug Type",
        :bug_description => "Bug Description"
      ),
      stub_model(BugReport,
        :user_id => 1,
        :bug_type => "Bug Type",
        :bug_description => "Bug Description"
      )
    ])
  end

  it "renders a list of bug_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bug Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bug Description".to_s, :count => 2
  end
end
