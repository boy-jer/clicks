require 'spec_helper'

describe "clicks/index.html.erb" do
  before(:each) do
    assign(:clicks, [
      stub_model(Click,
        :url => "Url",
        :request_ip => "Request Ip",
        :request_data => "MyText"
      ),
      stub_model(Click,
        :url => "Url",
        :request_ip => "Request Ip",
        :request_data => "MyText"
      )
    ])
  end

  it "renders a list of clicks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Request Ip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
