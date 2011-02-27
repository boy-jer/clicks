require 'spec_helper'

describe "clicks/new.html.erb" do
  before(:each) do
    assign(:click, stub_model(Click,
      :url => "MyString",
      :request_ip => "MyString",
      :request_data => "MyText"
    ).as_new_record)
  end

  it "renders new click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path, :method => "post" do
      assert_select "input#click_url", :name => "click[url]"
      assert_select "input#click_request_ip", :name => "click[request_ip]"
      assert_select "textarea#click_request_data", :name => "click[request_data]"
    end
  end
end
