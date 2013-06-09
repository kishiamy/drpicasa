require 'spec_helper'

describe "photos/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :image_path => "Image Path"
      ),
      stub_model(Photo,
        :image_path => "Image Path"
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Path".to_s, :count => 2
  end
end
