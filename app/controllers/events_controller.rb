class EventsController < ApplicationController

  def index
  	@event = Event.new
    @events = Event.where(:approved => true)
  end

  def create
  	@event = Event.create(event_params)
  	respond_to do |format|
    	if @event.save
        	format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, notice: 'Post was not successfully created.'  }
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
      redirect_to admin_events_path, notice: 'Post was successfully updated.'
    else
      redirect_to admin_events_path, notice: 'Post was not successfully updated.'
    end
  end

  def event_params
      params.require(:event).permit(:eventname, :startdate, :enddate, :shortdescription, :region, :website, :postcode, :toc, :approved)
  end

end
