module APIv1
  class Regions < Grape::API
    namespace :regions do
      desc "says hello"
      get "/hello" do
        {hello: "world"}
      end
    end
  end
end
