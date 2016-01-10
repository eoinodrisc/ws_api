module V1
  class Attendees < Grape::API
    include Grape::Kaminari

    resource :attendees do
      desc "Show a paginated list of attendees" do
        success V1::Entities::Attendee::Show
      end

      params do
        optional :interest, type: String, desc: "Optional paramater to order list by interests"
      end

      get do
        if params.has_key?(:interest) && Interest.pluck(:title).include?(params[:interest])
          interested_attendees = Attendee.by_interest(params[:interest])
          uninterested_attendees = Attendee.without_interest(params[:interest])
          attendees = uninterested_attendees.zip(interested_attendees).flatten

          present paginate(Kaminari.paginate_array(attendees)), with: V1::Entities::Attendee::Index
        else
          present paginate(Attendee.all), with: V1::Entities::Attendee::Index
        end
      end

      route_param :id do

        before do
          @attendee = Attendee.find_by_id(params[:id])
          error!("Attendee not found") if @attendee.nil?
        end

        desc "Show a particular attendee" do
          success V1::Entities::Attendee::Show
        end

        get do
          present @attendee, with: V1::Entities::Attendee::Show
        end
      end
    end
  end
end
