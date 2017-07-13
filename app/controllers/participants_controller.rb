class ParticipantsController < ApplicationController
  before_action :authenticate_admin!

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

    scan_time = Time.now

    # 1 - find user by id or :identifier_key

    # visitor = Visitor.find_by(identifier_key: "1449385128")

    visitor = Visitor.find_by(identifier_key: params[:identifier_key])

    # 2 - find all events connected to that user

    # 3 - filter those events to the ones that start in the next two hours or are current going ones (up to an hour after the event ends)

    visitor_events = visitor.events.select{|event| event.start_time < scan_time && event.end_time > (scan_time - 2.hours)}

    # 4 - get the first event from that list

    if visitor_events
      checkin_event = visitor_events.sort_by{|e| e[:start_time]}.first

    # 5 - update current check in to listed participant
    
      listed_participant = ListedParticipant.find_by(visitor_id: visitor[:id], event_id: checkin_event[:id])
      listed_participant.assign_attributes(check_in: scan_time)
      listed_participant.save
    else
      p "No Events"
    end



    # 6 - if alread checked in log check out for listed participant (as long as check in is 5 min + in past)

    # 3.5 - remove event if listed_participant has both check in and check out

    # listed_participant = ListedParticipant.find(params[:id])
    # event = listed_participant.event

    # if event.start_time < Time.now + 2.hours
    #   listed_participant.assign_attributes(check_in: Time.now)
    #   listed_participant.save
    # else
    #   flash[:warning] = "not time yet"
    # end
    # redirect_to "/participants/#{listed_participant.id}"

# private
#   def participant_params
#     params.require(:visitor).permit(:visitor_id)
#   end
end
