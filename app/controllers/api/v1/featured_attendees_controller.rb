class Api::V1::FeaturedAttendeesController < Api::BaseController
  def index
    fas = FeaturedAttendee.order('importance desc').paginate(
      page: params[:page] ? params[:page][:number] : 1,
      per_page: params[:page] ? params[:page][:size] : 25
    )
    render json: fas, meta: pagination_meta(fas)
  end

  def show
    fa = FeaturedAttendee.find(params[:id])
    render json: fa, serializer: CompleteFeaturedAttendeeSerializer
  end
end
