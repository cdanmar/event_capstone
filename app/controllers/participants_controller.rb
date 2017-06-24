class ParticipantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @listed_participants = ListedParticipant.all
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

  end

  def check_out

  end

# private
#   def participant_params
#     params.require(:visitor).permit(:visitor_id)
#   end
end
