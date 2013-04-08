require 'spec_helper'

describe API::Road do
  include Rack::Test::Methods

  def app
    API::Road
  end

  describe "get /" do
    it "shows the version when accessing the root" do
      get "/"
      last_response.status.should == 200
      JSON.parse(last_response.body).keys.first.should == "version"
    end
  end
end