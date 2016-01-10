module V1
  class Interests < Grape::API

    resource :interests do
      desc "Show a list of interests" do
        success V1::Entities::Interest::Base
      end

      get do
        present Interest.all, with: V1::Entities::Interest::Base
      end
    end
  end
end
