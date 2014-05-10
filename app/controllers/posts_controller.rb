class PostsController < ApplicationController
  def index
  	@posts = Post.all
    # authorize @posts
  end

  def show
    # automagic: params = { controller => "Apartments", :id => 3 }
  	@post = Post.find(params[:id])
    # automagic render from views: render 'posts/show'
  end

  def new
  	@post = Post.new
    # authorize @post
  end

  def create
    # params ={ :post => {:title => 'yay', :body => "im a body"}}
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
  if @post.save
    flash[:notice] = "Post was saved."
    redirect_to @post # I would want this from u as a beginner: post_path(post)   
  else
    flash[:error] = "There was an error saving the post. Please try again."
    render :new
  end
end
  
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end

