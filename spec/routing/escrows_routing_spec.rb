require "spec_helper"

describe EscrowsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/escrows").to route_to("escrows#index")
    end

    it "routes to #new" do
      expect(:get => "/escrows/new").to route_to("escrows#new")
    end

    it "routes to #show" do
      expect(:get => "/escrows/1").to route_to("escrows#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/escrows/1/edit").to route_to("escrows#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/escrows").to route_to("escrows#create")
    end

    it "routes to #update" do
      expect(:put => "/escrows/1").to route_to("escrows#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/escrows/1").to route_to("escrows#destroy", :id => "1")
    end

  end
end
