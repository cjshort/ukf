class EventsController < ApplicationController
     before_filter :authenticate_admin!,
    :only => [:edit, :update]

  def index
  	@event = Event.new
    @events = Event.where(:approved => true)
  end

  def create
  	@event = Event.create(event_params)
  	respond_to do |format|
    	if @event.save
        	format.html { redirect_to root_path, notice: 'Success! Your event has been submitted for approval.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, alert: 'Oops! It seems something went wrong in your submission, please try again.'  }
        	format.json {  }
    	end
    end
  end
  
  def show
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_events_path, notice: 'Event was successfully updated.'
    else
      redirect_to admin_events_path, alert: 'Event was not successfully updated.'
    end
  end

  def event_params
      params.require(:event).permit(:eventname, :startdate, :enddate, :shortdescription, :region, :website, :postcode, :toc, :approved)
  end

end
