require 'spec_helper'

describe "bug_reports/show.html.erb" do
  before(:each) do
    @bug_report = assign(:bug_report, stub_model(BugReport,
      :user_id => 1,
      :bug_type => "Bug Type",
      :bug_description => "Bug Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bug Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bug Description/)
  end
end
