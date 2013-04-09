module APIv1
  class Regions < Grape::API
    namespace :regions do
      desc "gets all the regions"
      get "/" do
        []
      end

      desc "create a region"
      post "/" do
        status 204
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
          status 404
        end

        desc "updates a region"
        patch "/" do
          status 200
        end

        desc "replaces a region"
        put "/" do
          status 200
        end

        desc "deletes a region"
        delete "/" do
          status 200
        end
      end
    end
  end
end
