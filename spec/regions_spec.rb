require "spec_helper"
describe APIv1::Regions do
  include Rack::Test::Methods

  def app
    APIv1::Regions
  end

  test_params = {
    :name => "Testregion",
    :lat  => 51,
    :lng  => 12,
  }

  it "should get an empty array when there are no regions" do
    get "/regions"
    last_response.status.should == 200
    last_response.body.should == "[]"
    JSON.parse(last_response.body).count.should == 0
  end

  it "should create a region when being POSTed to" do
    post "/regions", test_params
    last_response.status.should == 204
  end

  describe "operations" do
    before(:each) do
      # initialize a fake Repo in the background
    end

    it "should replace a region completely with a PUT request" do

    end

    it "should update a region completely with a PATCH request" do

    end

    it "should return a 404 if a region could not be found" do
      get "/regions/212323"
      last_response.status.should == 404
    end

    it "should remove a region with a delete request" do

    end
  end

  it "should say hello" do
    get "/regions/hello"
    JSON.parse(last_response.body).keys.first.should   == "hello"
    JSON.parse(last_response.body).values.first.should == "world"
  end
end
