class FooterlinksController < ApplicationController
  def editlisting
    @contact = Contact.new
  end

  def franchisorinfo
  end

  def aboutus
  end

  def contactus
    @contact = Contact.new
  end

  def toc
  end

  def contactcreate
    if params[:contact][:nickname].blank?
      @contact = Contact.create(contact_params)
      if @contact.save
        GenericMailer.contact_mailer(@contact).deliver
      else
        redirect_to :back, alert: "Oops! It looks like you have entered something incorrectly, please try again."
      end
    else
      redirect_to :back, alert: "Oops! It looks like you have entered something incorrectly, please try again."
    end
  end

  def contact_params
    params.require(:contact).permit(:fullname, :email, :query, :nickname, :toc)
  end
end
