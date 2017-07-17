class ParticipantsController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :authenticate_admin!

  def index
    @listed_participants = ListedParticipant.all
    @visitors = Visitor.all
  end

  def show
    @listed_participant = ListedParticipant.find(params[:id])
  end

  def new
    @listed_participant = ListedParticipant.new
  end


  def create

    if params.has_key?(:identifier_key)
      check_in(params[:identifier_key])
    else
      @listed_participant = ListedParticipant.new(visitor_id: params[:visitor]["visitor_id"], event_id: params[:event_id])



      if @listed_participant.save!
        redirect_to "/participants/index"
      else
        @listed_participant.errors.full_messages
        redirect_to "/participants/index"
      end
    end
    # @listed_participant = ListedParticipant.new(visitor_id: params[:visitor]["visitor_id"], event_id: params[:event]["event_id"])

    # # p "QQQQQQQQQQQQQQQQQQ"
    # # p params[:visitor]

    # # p "WWWWWWWWWWWWWWWWWW"
    # # p params[:event_id]

    # if @listed_participant.save!
    #   redirect_to "/participants/index"
    # else
    #   @listed_participant.errors.full_messages
    #   redirect_to "/participants/index"
    # 

  end

  def destroy

  end

  def check_in(key)

    scan_time = Time.now
    visitor = Visitor.find_by(identifier_key: key)
    visitor_events = visitor.events.select{|event| event.start_time < scan_time && event.end_time > (scan_time - 2.hours)}

    if visitor_events
      checkin_event = visitor_events.sort_by{|e| e[:start_time]}.first
      listed_participant = ListedParticipant.find_by(visitor_id: visitor[:id], event_id: checkin_event[:id])
      listed_participant.assign_attributes(check_in: scan_time)
      listed_participant.save
    else
      p "No Events"
    end
  end

# private
#   def participant_params
#     params.require(:visitor).permit(:visitor_id)
#   end
end
