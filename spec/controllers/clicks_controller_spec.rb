require 'spec_helper'

describe ClicksController do

  def mock_click(stubs={})
    (@mock_click ||= mock_model(Click).as_null_object).tap do |click|
      click.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all clicks as @clicks" do
      Click.stub(:all) { [mock_click] }
      get :index
      assigns(:clicks).should eq([mock_click])
    end
  end

  describe "GET show" do
    it "assigns the requested click as @click" do
      Click.stub(:find).with("37") { mock_click }
      get :show, :id => "37"
      assigns(:click).should be(mock_click)
    end
  end

  describe "GET new" do
    it "assigns a new click as @click" do
      Click.stub(:new) { mock_click }
      get :new
      assigns(:click).should be(mock_click)
    end
  end

  describe "GET edit" do
    it "assigns the requested click as @click" do
      Click.stub(:find).with("37") { mock_click }
      get :edit, :id => "37"
      assigns(:click).should be(mock_click)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created click as @click" do
        Click.stub(:new).with({'these' => 'params'}) { mock_click(:save => true) }
        post :create, :click => {'these' => 'params'}
        assigns(:click).should be(mock_click)
      end

      it "redirects to the created click" do
        Click.stub(:new) { mock_click(:save => true) }
        post :create, :click => {}
        response.should redirect_to(click_url(mock_click))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved click as @click" do
        Click.stub(:new).with({'these' => 'params'}) { mock_click(:save => false) }
        post :create, :click => {'these' => 'params'}
        assigns(:click).should be(mock_click)
      end

      it "re-renders the 'new' template" do
        Click.stub(:new) { mock_click(:save => false) }
        post :create, :click => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested click" do
        Click.should_receive(:find).with("37") { mock_click }
        mock_click.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :click => {'these' => 'params'}
      end

      it "assigns the requested click as @click" do
        Click.stub(:find) { mock_click(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:click).should be(mock_click)
      end

      it "redirects to the click" do
        Click.stub(:find) { mock_click(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(click_url(mock_click))
      end
    end

    describe "with invalid params" do
      it "assigns the click as @click" do
        Click.stub(:find) { mock_click(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:click).should be(mock_click)
      end

      it "re-renders the 'edit' template" do
        Click.stub(:find) { mock_click(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested click" do
      Click.should_receive(:find).with("37") { mock_click }
      mock_click.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the clicks list" do
      Click.stub(:find) { mock_click }
      delete :destroy, :id => "1"
      response.should redirect_to(clicks_url)
    end
  end

end
