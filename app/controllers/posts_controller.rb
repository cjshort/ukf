class PostsController < ApplicationController
  def index
  	@post = Post.new
    @post1 = Post.last
    @post2 = Post.offset(1).last
    @post3 = Post.offset(2).last
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
    redirect_to :back, notice: "Congratulations, you are now signed up to our free mailing list!"
  end

  def create
  	@post = Post.create(post_params)
  	respond_to do |format|
    	if @post.save
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_themoneyzone_path, notice: 'Post was successfully updated.'
    else
      redirect_to admin_themoneyzone_path, notice: 'Post was not successfully updated.'
    end
  end

  def post_params
      params.require(:post).permit(:title, :content, :name, :website, :approved)
  end
end