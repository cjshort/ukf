class Franchises::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

      mailchimp_list_id = "bdb035f3a1"
      gb = Gibbon::API.new
      gb.lists.subscribe({:id => mailchimp_list_id,
        :email => {:email => params[:franchise][:email]},
        :merge_vars => {
          :FULLNAME => params[:franchise][:fullname],
          :JOBTITLE => params[:franchise][:jobtitle],
          :FRANCHISE => params[:franchise][:listing_attributes][:franchisename],
          :WEBSITE => params[:franchise][:listing_attributes][:websie]},
        :double_optin => false,
        :send_welcome => false})

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def sign_up(resource_name, resource)
  end

  private
 
  def sign_up_params
    params.require(:franchise).permit(:fullname, :email, :jobtitle, :password, :password_confirmation, listing_attributes: [:franchisename, :leadrecepient, :longdescription, :website, :mininvestment, :category, :nickname, :franchise_id])
  end
 
  def account_update_params
    params.require(:franchise).permit(:fullname, :email, :jobtitle, :password, :password_confirmation, :current_password, listing_attributes: [:franchisename, :leadrecepient, :longdescription, :website, :mininvestment, :category, :nickname, :franchise_id])
  end
end