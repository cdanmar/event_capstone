class ParticipantsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @listed_participants = ListedParticipant.all
  end

  def new
    @listed_participant = ListedParticipant.new
  end

  def create
    @listed_participant = ListedParticipant.new(participant_params)

    @listed_participant.save

    # if @listed_participant.save
    #   redirect_to "/participants/index"
    # end

  end

  def destroy

  end

  def check_in

  end

  def check_out

  end

private
  def participant_params
    params.require(:visitor).permit(:visitor_id)
  end
end
