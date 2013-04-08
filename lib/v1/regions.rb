module APIv1
  class Regions < Grape::API
    namespace :regions do
      desc "gets all the regions"
      get "/" do
        []
      end

      desc "says hello"
      get "/hello" do
        {hello: "world"}
      end

      params do
        requires :region_id, :type => Integer, :desc => "A numeric user id"
      end

      namespace ":region_id" do
        desc "gets a speicific region, based on the id given"
        get "/:region_id" do
          Region.find_by_id id
        end

        desc "updates a region"
        patch "/:region_id" do
          region = Region.find_by_id id
          region.update_attributes params
        end

        desc "replaces a region"
        put "/:region_id" do
          region = Region.find_by_id id
          region.update_attributes params
        end
      end
    end
  end
end
