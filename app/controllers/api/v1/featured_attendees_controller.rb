class Api::V1::FeaturedAttendeesController < ActionController::API
  def index
    fas = FeaturedAttendee.limit(25)
    render json: fas, each_serializer: FeaturedAttendeeSerializer
  end

  def show
    fa = FeaturedAttendee.find(params[:id])
    render json: fa, serializer: CompleteFeaturedAttendeeSerializer
  end
end
