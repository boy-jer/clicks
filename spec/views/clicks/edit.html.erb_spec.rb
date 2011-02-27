require 'spec_helper'

describe "clicks/edit.html.erb" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :url => "MyString",
      :request_ip => "MyString",
      :request_data => "MyText"
    ))
  end

  it "renders the edit click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => click_path(@click), :method => "post" do
      assert_select "input#click_url", :name => "click[url]"
      assert_select "input#click_request_ip", :name => "click[request_ip]"
      assert_select "textarea#click_request_data", :name => "click[request_data]"
    end
  end
end
