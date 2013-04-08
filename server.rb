require "grape"
require "grape-swagger"
require "json"
require "rack/cors"

require File.expand_path(File.join(*%w[ lib/api_v1 ]), File.dirname(__FILE__))

module API
  class Road < Grape::API

    use Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => :get
      end
    end

    format :json

    get "/" do
      {version: "v1"}
    end

    mount APIv1::Regions

    add_swagger_documentation :api_version => "0.0.1", :mount_path  => "api_docs"

  end
end
