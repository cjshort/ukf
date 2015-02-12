class PostsController < ApplicationController
  before_filter :authenticate_admin!,
  :only => [:edit, :update]
  impressionist actions: [:show], unique: [:session_hash]

  def index
    @post1 = Post.where(:approved => true).last
    @post2 = Post.where(:approved => true).offset(1).last
    @post3 = Post.where(:approved => true).offset(2).last
    @post4 = Post.where(:approved => true).offset(3).last
    @postlist = Post.where(:approved => true).all.offset(4)
  end

  def subscribe
    @mailchimp_list_id = "01d4743207"
    gb = Gibbon::API.new
    email = params[:email]
      gb.lists.subscribe({
      :id => mailchimp_list_id,
      :email => email,
      :double_optin => false,
      :send_welcome => false
    })

    redirect_to :back, notice: "Success! you are now signed up to our free mailing list!"
  end

  def create
    if params[:post][:nickname].blank?
    	@post = Post.create(post_params)
    	respond_to do |format|
      	if @post.save
          	format.html { redirect_to root_path, notice: 'Success! Your post has been submitted for approval.' }
          	format.json {  }
      	else
          	format.html { redirect_to root_path, notice: 'Oops! It seems something went wrong in your submission, please try again.'  }
          	format.json {  }
      	end
      end
    else
      redirect_to :back, alert: "Oops! It looks like you have entered something incorrectly, please try again."
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
    @metadesc = @post.content.truncate(200)
    impressionist(@post)

    @query = @post.title
    if @post.title.nil?
      @listing = Listing.where(:approved => true).search.all.records.take(5)
    else
      @listing = Listing.where(:approved => true).search(@post.title).records.take(5)
    end

  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_moneyzone_path, notice: 'Post was successfully updated.'
    else
      redirect_to admin_moneyzone_path, notice: 'Post was not successfully updated.'
    end
  end

  def post_params
      params.require(:post).permit(:image, :title, :content, :name, :website, :approved, :toc, :nickname)
  end
end