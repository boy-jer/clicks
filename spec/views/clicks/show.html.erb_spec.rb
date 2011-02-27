require 'spec_helper'

describe "clicks/show.html.erb" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :url => "Url",
      :request_ip => "Request Ip",
      :request_data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Request Ip/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
