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

      desc "lists the available methods for the resource regions"
      options "/" do
        {allowed: ["GET", "OPTIONS", "PUT", "PATCH", "DELETE", "POST"]}
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

        desc "deletes a region"
        delete "/" do

        end
      end
    end
  end
end
