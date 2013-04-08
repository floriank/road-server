require "spec_helper"
describe APIv1::Regions do
  include Rack::Test::Methods

  def app
    API::Road
  end

  test_params = {
    :name => "Testregion",
    :lat  => 51,
    :lng  => 12,
  }

  describe "get regions" do
    it "should deny access to regions at all if not from the right host" do
      get "/regions"
      last_response.status.should == 403

      post "/regions", test_params
      last_response.status.should == 403
    end

    it "should get be able to get regions when host is allowed" do
      get "/regions"
      last_response.status.should == 200
    end

    it "should get an empty array when there are no regions" do
      get "/regions"
      last_response.body.should == "[]"
      JSON.parse(last_response.body).count.should == 0
    end

    it "should create a region when being posted to" do
      post "/regions", test_params
      last_response.status.should == 204
      json = JSON.parse last_response.body
      json.length.should == 1
    end

    it "should say hello" do
      get "/regions/hello"
      last_response.status.should == 200
      JSON.parse(last_response.body).keys.first.should   == "hello"
      JSON.parse(last_response.body).values.first.should == "world"
    end
  end
end
