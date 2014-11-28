class ListingsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]
  before_action :industrylist
  before_action :set_listing, only: [:show, :lead]

  def new
  	@listing = Listing.new
  end

  def create
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
      :double_optin => false})

  	respond_to do |format|
    	if @listing.save
        	format.html { redirect_to root_path, notice: 'Success! Your listing has been submited for approval.' }
        	format.json {  }
    	else
        	format.html { redirect_to root_path, alert: 'There was an error in your listing submission, please try again.'  }
        	format.json {  }
    	end
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to admin_listings_path, notice: 'Post was successfully updated.'
    else
      redirect_to admin_listings_path, notice: 'Post was not successfully updated.'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to 'root_path', :notice => "Listing Successfully Deleted"
  end

  def show
    @listing = Listing.find(params[:id])
    @lead = Lead.new
    @story = Story.new
    @stories = Story.where(:listing_id => params[:id]).reverse.take(4)
  end

  def leadcreate
    @listing = Listing.find(params[:id])
    @lead = Lead.create(lead_params)
    LeadMailer.lead_mailer(@listing, @lead).deliver

    mailchimp_list_id = "90e42ef292"
    gb = Gibbon::API.new
    gb.lists.subscribe({:id => mailchimp_list_id,
      :email => {:email => @lead.email},
      :merge_vars => {
        :FULLNAME => @lead.fullname,
        :TELEPHONE => @lead.phone,
        :ADDRESS => @lead.address,
        :CITY => @lead.city,
        :REGION => @lead.region,
        :POSTCODE => @lead.postcode},
      :double_optin => false})

    redirect_to listing_path(@listing), notice: "Enquiry sent"
  end

  def storycreate
    @listing = Listing.find(params[:id])
    @story = @listing.stories.create(story_params)
    redirect_to listing_path(@listing), notice: "Story Sent"
  end

  def story_params
    params.require(:story).permit(:fullname, :email, :jobrole, :story, :toc)
  end

  def lead_params
    params.require(:lead).permit(:fullname, :email, :phone, :address, :city, :region, :postcode, :country, :contactpreferal)
  end
  
  def listing_params
  	params.require(:listing).permit(:fullname, :jobtitle, :email, :franchisename, :leadrecepient, :shortdescription, :longdescription, :website, :branchcount, :scale, :mininvestment, :investmentrange, :category, :hexbg, :logourl, :facebook, :twitter, :linkedin, :googleplus, :approved)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
