class PostsController < ApplicationController
  def index
  	@posts = Post.all
    # authorize @posts
  end

  def show
    # automagic: params = { controller => "Apartments", :id => 3 }
  	@post = Post.find(params[:id])
    # automagic render from views: render 'posts/show'
    @topic =Topic.find(params[:topic_id])
  end

  def new
  	 @topic = Topic.find(params[:topic_id])
     @post = Post.new
    # authorize @post
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    # params ={ :post => {:title => 'yay', :body => "im a body"}}
    @post = current_user.posts.build(post_params)
    @post.topic = @topic

    authorize @post
  if @post.save
    flash[:notice] = "Post was saved."
    redirect_to [@topic, @post], notice: "Post was saved successfully." # I would want this from u as a beginner: post_path(post)   
  else
    flash[:error] = "There was an error saving the post. Please try again."
    render :new
  end
end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  private

def post_params
  params.require(:post).permit(:title, :body)
  end

end

