module Newsroom
  class PostsController < NewsroomController

    # GET /posts
    # GET /posts.json
    def index
      if params[:category].blank?
      @posts = current_author.posts.most_recent
      @posts = storage.list_for(params[:page], params[:tags])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC")
    end
  end


    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = storage.friendly.find(params[:id])
    end

    private

    def storage
      Post.published
    end
  end
end
