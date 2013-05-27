require 'spec_helper'

describe SessionsController do
  describe "get albums" do
    it "responds successfully with an HTTP 200 status code" do
      @token = mock(token)
      @token.stub!(:albums).and_return(true)
      get :albums, { :token => @token }
      expect(response).to be_success
      expect(response.status).to eq(200)
      controller.stub(:albums).and_return(true)
    end
  end
end
