module APIv1
  class Regions < Grape::API
    namespace :regions do
      desc "gets all the regions"
      get "/" do
      end

      desc "says hello"
      get "/hello" do
        {hello: "world"}
      end

      params do
        requires :region_id, :type => Integer, :desc => "A numeric user id"
      end

      namespace ":region_id" do
        desc "gets a specific region, based on the id given"
        get "/" do

        end

        desc "updates a region"
        patch "/" do

        end

        desc "replaces a region"
        put "/" do

        end
      end
    end
  end
end
