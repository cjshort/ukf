class ListingsController < ApplicationController
  before_filter :authenticate_admin!,
  :only => [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:session_hash]
  before_action :industrylist
  before_action :set_listing, only: [:show, :lead]
  
  def create
    if params[:listing][:nickname].blank?
    	@listing = Listing.create(listing_params)

      mailchimp_list_id = "bdb035f3a1"
      gb = Gibbon::API.new
      gb.lists.subscribe({:id => mailchimp_list_id,
        :email => {:email => @listing.email},
        :merge_vars => {
          :FULLNAME => @listing.fullname,
          :JOBTITLE => @listing.jobtitle,
          :FRANCHISE => @listing.franchisename,
          :WEBSITE => @listing.website},
        :double_optin => false,
        :send_welcome => false})

    	respond_to do |format|
      	if @listing.save
          	format.html { redirect_to root_path, notice: 'Success! Your listing has been submited for approval.' }
          	format.json {  }
      	else
          	format.html { redirect_to root_path, alert: 'Oops! It seems something went wrong in your submission, please try again.'  }
          	format.json {  }
      	end
      end
    else
      redirect_to :back, alert: "Oops! It looks like you have entered something incorrectly, please try again."
    end
  end

  def edit
    @listing = Listing.friendly.find(params[:id])
  end

  def update
    @listing = Listing.friendly.find(params[:id])
    if @listing.update(listing_params)
      redirect_to admin_listings_path, notice: 'Listing was successfully updated.'
    else
      redirect_to admin_listings_path, alert: 'Listing was not successfully updated.'
    end
  end

  def destroy
    @listing = Listing.friendly.find(params[:id])
    @listing.destroy
    redirect_to 'root_path', :notice => "Listing Successfully Deleted"
  end

  def show
    @metadesc = @listing.longdescription.truncate(250)
    @listing = Listing.friendly.find(params[:id])
    @lead = Lead.new
    @story = Story.new
    @stories = Story.where(:listing_id => params[:id]).reverse.take(4)
    impressionist(@listing)
    @related = Listing.where(:category => @listing.category).sort_by { rand }.slice(0, 4)
  end

  def leadcreate
    @listing = Listing.friendly.find(params[:id])

    if Lead.where(listing_id: @listing.id, email: current_user.email).present?
      redirect_to listing_path(@listing), alert: "You have already submitted an enquiry to this franchise"
    else
      @lead = @listing.leads.create(:fullname => current_user.fullname, :email => current_user.email, :phone => current_user.phone, :method => current_user.method, :listing_id => @listing.id)

      if @lead.save
      LeadMailer.lead_mailer(@listing, @lead).deliver

      mailchimp_list_id = "90e42ef292"
      gb = Gibbon::API.new
      gb.lists.subscribe({:id => mailchimp_list_id,
        :email => {:email => @lead.email},
        :merge_vars => {
          :FULLNAME => @lead.fullname,
          :TELEPHONE => @lead.phone},
        :double_optin => false,
        :send_welcome => false})

      redirect_to :back, notice: "Your interest has been registered, #{@listing.franchisename} will get back to you shortly."
      else
      redirect_to listing_path(@listing), alert: "Oops! It seems something went wrong, please try again."
      end
    end
  end

  def lead_params
    #params.require(:lead).permit(:fullname, :email, :phone, :method, :toc, :listing_id,)
  end
  
  def listing_params
  	params.require(:listing).permit(:fullname, :jobtitle, :email, :franchisename, :leadrecepient, :longdescription, :website, :branchcount, :scale, :mininvestment, :investmentrange, :category, :hexbg, :logourl, :facebook, :twitter, :linkedin, :googleplus, :approved, :toc, :spotlight, :topfranchise, :nickname)
  end

  private

  def set_listing
    @listing = Listing.friendly.find(params[:id])
  end

end
