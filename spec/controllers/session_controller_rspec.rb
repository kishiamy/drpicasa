require "spec_helper"

describe SessionsController do
  describe "get albums" do
    it "responds successfully with an HTTP 200 status code" do
      controller.stub(:credentials).and_return("ya29.AEHS6ZSHdSPZISaM6_GoUnDVCrVx19heL3h2i_4aSIrK")
      get :albums, { :token => "ya29.AEHS6ZSHdSPZISaM6_GoUnDVCrVx19heL3h2i_4aSIrK" }
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

    # it "loads all of the posts into @posts" do
    #   post1, post2 = Post.create!, Post.create!
    #   get :index

    #   expect(assigns(:posts)).to match_array([post1, post2])
    # end
  end
end