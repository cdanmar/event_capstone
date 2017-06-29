class ParticipantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @listed_participants = ListedParticipant.all
  end

  def show
    @listed_participant = ListedParticipant.find(params[:id])
  end

  def new
    @listed_participant = ListedParticipant.new
  end


  def create
    @listed_participant = ListedParticipant.new(visitor_id: params[:visitor]["visitor_id"], event_id: params[:event]["event_id"])

    # p "QQQQQQQQQQQQQQQQQQ"
    # p params[:visitor]

    # p "WWWWWWWWWWWWWWWWWW"
    # p params[:event_id]

    if @listed_participant.save!
      redirect_to "/participants/index"
    else
      @listed_participant.errors.full_messages
      redirect_to "/participants/index"
    end

  end

  def destroy

  end

  def check_in
    listed_participant = ListedParticipant.find(params[:id])
    event = listed_participant.event

    if event.start_time < Time.now + 2.hours
      listed_participant.assign_attributes(check_in: Time.now)
      listed_participant.save
    else
      flash[:warning] = "not time yet"
    end
    redirect_to "/participants/#{listed_participant.id}"
  end


# private
#   def participant_params
#     params.require(:visitor).permit(:visitor_id)
#   end
end
