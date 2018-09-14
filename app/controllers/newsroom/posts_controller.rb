module Newsroom
  class PostsController < NewsroomController

    # GET /posts
    # GET /posts.json
  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
      @posts = storage.list_for(params[:page], params[:tags])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
    end
    @meta_title = meta_title 'The NewsPanel'
    @meta_description = 'Global Trending News'
  end


    # GET /posts/1
    # GET /posts/1.json
    def show
      @posts = storage.friendly.find(params[:id])
    end

    private

    def storage
      Post.published
    end
  end
end
