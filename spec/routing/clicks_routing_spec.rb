require "spec_helper"

describe ClicksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/clicks" }.should route_to(:controller => "clicks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/clicks/new" }.should route_to(:controller => "clicks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/clicks/1" }.should route_to(:controller => "clicks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/clicks/1/edit" }.should route_to(:controller => "clicks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/clicks" }.should route_to(:controller => "clicks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/clicks/1" }.should route_to(:controller => "clicks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/clicks/1" }.should route_to(:controller => "clicks", :action => "destroy", :id => "1")
    end

  end
end
